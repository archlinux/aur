# Maintainer: Dan Johansen <strit@manjaro.org>
# Contributor: Shaber

pkgname=libcprime
pkgver=4.2.2
pkgrel=1
pkgdesc="A library for bookmarking, saving recent activites, managing settings of CoreApps."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL3')
depends=('qt5-base' 'qt5-connectivity' 'libnotify')
makedepends=('cmake' 'ninja')
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('fb674b6ddf9feb7aa04d0f0ed0234a8a')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-v${pkgver} \
	-GNinja \
	-DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
	-DCMAKE_INSTALL_LIBDIR=${pkgdir}/usr/lib
  ninja
}

package() {
  cd build
  ninja install
}
