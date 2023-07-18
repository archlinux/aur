# Maintainer: Victor Tran <vicr12345 at gmail dot com>
# Maintainer: Solomon Choina <shlomochoina at gmail dot com>
#
pkgname=lightdm-thedesk-greeter
pkgver=1.0
pkgrel=1
pkgdesc="LightDM greeter for theDesk"
arch=("x86_64" "aarch64")
url="https://github.com/theCheeseboard/lightdm-thedesk-greeter"
license=('GPL3')
depends=('libtdesktopenvironment' 'lightdm')
makedepends=('git' 'qt6-tools' 'cmake' 'clang')
source=("$pkgname-$pkgver"::"https://github.com/theCheeseboard/lightdm-thedesk-greeter/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2ac3cc8d663d0ce0fa0d0eba9fb68d6938776379711b5efa0aa013848e4bb552')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install "build"
}
