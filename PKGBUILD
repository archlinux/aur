# Maintainer: Tom van der Lee <t0m.vd.l33@gmail.com>
pkgname=bir
pkgver=2.0
pkgrel=1
pkgdesc="Simple graphical batch image resizer"
arch=("any")
url="https://github.com/agronick/BIR"
license=("GPL")
depends=("qt5-base")
makedepends=("gcc")
provides=("bir")
conflicts=("bir-git")
source=("https://github.com/agronick/BIR/archive/$pkgver.tar.gz")
sha256sums=('e17bd1239343863006fa830bce229046c75512e66d51c529bda00cdf8c76e341')

build() {
	cd "$srcdir/BIR-$pkgver/build"
	qmake-qt5 ../
	make
}

package() {
	cd "$srcdir/BIR-$pkgver/build"
	install -Dm644 "$srcdir/BIR-$pkgver/bir.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/bir.png"
	install -Dm755 "$srcdir/BIR-$pkgver/bir.desktop" "$pkgdir/usr/share/applications/bir.desktop"
	make INSTALL_ROOT="$pkgdir/" install
}
