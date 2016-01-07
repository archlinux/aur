# Maintainer: Andreas Grapentin <andreas@grapentin.org>
pkgname=fbview
pkgver=1.0
pkgrel=1
pkgdesc="small framebuffer document viewer for pdf and djvu"
arch=('i686' 'x86_64')
url="github.com/oaken-source/fbview"
license=('BSD')
depends=('mupdf')
optdepends=('poppler: alternative .pdf support', 'djvulibre: .djvu support')
install='fbview.install'
source=("http://files.grapentin.org/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('fa307f8db0438f29d792733f76ea648b')

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
