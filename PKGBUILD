#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-aur
pkgver=2015.12.6.2
pkgrel=1
pkgdesc='AUR-related modules and helper utilities (aurploader, aurquery, aurtomatic).'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-aur"
depends=(pyalpm python-xdg python3 python3-xcgf python3-xcpf)
optdepends=('curl: Aurploader support')
replaces=(aurploader)
conflicts=(aurploader)
provides=(aurploader)
source=(
  http://xyne.archlinux.ca/projects/python3-aur/src/python3-aur-2015.12.6.2.tar.xz
  http://xyne.archlinux.ca/projects/python3-aur/src/python3-aur-2015.12.6.2.tar.xz.sig
)
sha512sums=(
  bf556ffec8a519ba0f7dabb9bb3d5a77ef7ad5eb859719a70448645ede10ef7f69c7fdddcad6ae846a1732f189c2b8ad99b1010888bb9a73cca5adbee7f339d5
  15a050ca035a57d0f162dce05b7aba98e9e183619bb00ab87253f52aa2f9d245f10721d1f3d6df20797eb70e2ab1a3333f519ef11b0d6ef7a8533c2a4dd0d052
)
md5sums=(
  a6aa092b4b1500789c206e8090083a35
  fa85e08b8cf895e3c5bee4925c495960
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  for aurfoo in aur*
  do
    if [[ -x $aurfoo ]]
    then
      install -Dm755 "$aurfoo" "$pkgdir/usr/bin/$aurfoo"
    fi
  done
}


# vim: set ts=2 sw=2 et:
