# Contributor: Shaber
# Maintainer: Dan Johansen <strit@manjaro.org>

pkgname=coreinfo
pkgver=2.7.0
pkgrel=1
pkgdesc="A file information tool from the CoreApps family."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/$pkgname"
license=('GPL3')
depends=('qt5-base' 'libcprime' 'libmediainfo' 'zlib')
groups=('coreapps')
source=("https://gitlab.com/cubocore/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('5c0ddf07451aa25aa96061d3fadecfd9')

prepare() {
  mkdir -p build
}

build() {
  cd ${pkgname}-v${pkgver}

  qmake-qt5 ${pkgname}.pro
  make
}

package() {
  cd ${pkgname}-v${pkgver}
  make INSTALL_ROOT=${pkgdir} install
}
