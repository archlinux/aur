#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-aur
pkgver=2016
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
  http://xyne.archlinux.ca/projects/python3-aur/src/python3-aur-2016.tar.xz
  http://xyne.archlinux.ca/projects/python3-aur/src/python3-aur-2016.tar.xz.sig
)
sha512sums=(
  13e3281ed2442023a0e3d4c1812cf913c7d62f440897f08c94d510c4c92a6a16b0366b13636fb1c3b64a808b4d360f3a3184915b367aff6e13027fd0807f5c1c
  752493436f3fdce42bae841c58c8052c12835feb2d003d6eaeabd3b6b6b9d26fd8065e5367edb1930e71fc4f9d56625f7ff896d42ee8a8376554626adad326f3
)
md5sums=(
  542b73bdd8d545271dca88aa0ea0e98b
  f6c1ce87991a4bc8530de2c871049804
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
