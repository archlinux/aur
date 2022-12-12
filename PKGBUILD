# Maintainer: Gabriel Guldner <gabriel at guldner dot eu>

# Contributor: William Franco Abdul Hai <williamhai at hotmail dot com>

pkgname='koi'
pkgver=0.2.3
pkgrel=2
pkgdesc="Switch between light and dark themes on KDE Plasma"
arch=('x86_64' 'aarch64')
url="https://github.com/baduhai/Koi"
license=('LGPL3')
depends=('kconfig' 'kcoreaddons' 'kwidgetsaddons' 'kpackage' 'hicolor-icon-theme')
makedepends=('qt5-base' 'extra-cmake-modules')
optdepends=('xsettingsd: Apply settings to GTK applications on the fly')
source=("https://github.com/baduhai/Koi/archive/$pkgver.tar.gz")
sha256sums=('811f6bdaa8146f0da6103742816cc48f571d344d2cd8cd9ac2448ca518825e32')

build() {
	cd "Koi-$pkgver/src"
    mkdir -p build && cd build

    cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..

    make
}

package() {
    cd "Koi-$pkgver/src/build"
    make DESTDIR="$pkgdir" install
}
