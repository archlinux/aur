#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-aur
pkgver=2015.12.6.3
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
  http://xyne.archlinux.ca/projects/python3-aur/src/python3-aur-2015.12.6.3.tar.xz
  http://xyne.archlinux.ca/projects/python3-aur/src/python3-aur-2015.12.6.3.tar.xz.sig
)
sha512sums=(
  0ed60084179d469024d4f9c082810213346910012d886d1288108652fd92d55d586c541897638549697178aa2a9cf8ed50db6f6178e94869b29ac948dc3bdb39
  11a322b4adbdc9906aa6349e897b08f1529d4d2dd4f30ffbfa25b11fab536e679dd31bf94f3530479392ae063ebb32b9a01776c3f80aca5cc649f81cd24b9643
)
md5sums=(
  40c55fb9631b9e5bcd842ff3708343e4
  3bfaa4225fa9127be5e3686e186e8117
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
