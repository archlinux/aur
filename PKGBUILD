# Maintainer: Faerbit <faerbit at gmail dot com>
# Submitter : Jerome Leclanche <jerome@leclan.ch>

pkgname=obconf-qt
pkgver=0.11.1
pkgrel=1
pkgdesc="Openbox configuration tool. Qt port of ObConf"
arch=("i686" "x86_64")
url="http://lxqt.org"
license=("GPL2")
depends=("qt5-base" "openbox" "qt5-x11extras" "gtk-update-icon-cache")
makedepends=("cmake" "qt5-tools" "liblxqt" "git" "lxqt-build-tools")
source=("https://github.com/lxde/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
        "https://github.com/lxde/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz.asc")
validpgpkeys=(7C733BA5F585AAD669E4D23A42C9C8D3AF5EA5E3)
sha256sums=('3af6610a01740c8d9221c7eecc8114c8db953341990b2008f9cbc65ea856e216'
            'SKIP')

build() {
	mkdir -p build
	cd build
	cmake "$srcdir/$pkgname-$pkgver" \
            -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
