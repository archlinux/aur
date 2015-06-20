pkgname=tcl-vfs
pkgver=20150321
pkgrel=2
pkgdesc="virtual file system for tcl"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/tclvfs/"
license=('custom')
depends=(tcl)
makedepends=(tcl)
conflicts=(tclvfs-cvs)
source=(https://github.com/l3iggs/${pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('4b23b16dca5570d2bcfaa576cadd4c53')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -D -m644 license.terms "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
