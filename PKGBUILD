# Maintainer: Brandon Clifford <brandon099 at gmail dot com>

pkgname=bdf-ctrld-git
pkgver=r30.50e77e2
pkgrel=1
pkgdesc='A fixed-width bitmap font forked from Dina and Proggy Tiny'
arch=('any')
url='https://github.com/bjin/ctrld-font'
depends=('xorg-font-utils' 'fontconfig')
makedepends=('git' 'make')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname::git+https://github.com/bjin/ctrld-font")
install=$pkgname.install
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  make fonts.dir
  install -d -m755 "$pkgdir/usr/share/fonts/misc/"
  install -m644 -t "$pkgdir/usr/share/fonts/misc/" *.pcf
}
