pkgname=livetikz
_pkgname=LiveTikZ
pkgver=0.5
pkgrel=1
pkgdesc="A live preview for TikZ drawings"
arch=('x86_64' 'i686')
url="https://github.com/misc0110/LiveTikZ"
license=('GPL')
depends=('poppler' 'poppler-qt5' 'kcoreaddons' 'kxmlgui' 'ki18n' 'ktexteditor'
'kparts')
makedepends=('cmake' 'extra-cmake-modules')
source=("https://github.com/misc0110/LiveTikZ/archive/release-${pkgver}.tar.gz")
md5sums=('45401b590772be51efac8075bfc7373d')

build() {
	mkdir -p "$srcdir/$_pkgname-release-$pkgver/build"
	cd "$srcdir/$_pkgname-release-$pkgver/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$srcdir/$_pkgname-release-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}
