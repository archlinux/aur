#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pkg_scripts
pkgver=2015
pkgrel=1
pkgdesc='A collection of pacman and package-related utilities.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/pkg_scripts"
depends=(python3 pyalpm)
source=(
  http://xyne.archlinux.ca/projects/pkg_scripts/src/pkg_scripts-2015.tar.xz
  http://xyne.archlinux.ca/projects/pkg_scripts/src/pkg_scripts-2015.tar.xz.sig
)
sha512sums=(
  4bc984310ca0c6a7d3989c184adf6446400a830a9e27ea3a7d5f5cc2466f9bccdb9696ee18a4781fd08210db3448f2dcd89ca25b3396ba5ed0249a1add2e385a
  09767a30c7db17bba4db2fad1c82f8ec10b111f69ccd206d80b2c81810c650f3c7919598dfbdca9f808a3baf412cd86ea846360f5526497d0174e3ff9c4dc4a7
)
md5sums=(
  5c2d675f4fb1c58307f6f8ea122c853f
  5932b3715a367d030bbb44ee52f5cb9d
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver/src"
  for pkg in pkg-*
  do
    name="${pkg##*/}"
    install -Dm755 "$name" "$pkgdir/usr/bin/$name"
  done
}

# vim: set ts=2 sw=2 et:
