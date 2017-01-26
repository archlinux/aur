pkgname=chakaracore
pkgver=1.4.0
pkgrel=1
pkgdesc="the core part of the Chakra Javascript engine that powers Microsoft Edge"
arch=('any')
url="https://github.com/Microsoft/ChakraCore"
license=('MIT')
depends=('cmake'
	'clang'
	'icu')
source=("https://github.com/Microsoft/ChakraCore/archive/v${pkgver}.tar.gz")
md5sums=('d6777fce9377078b902feddcbff352f3')

build() {
  cd "$srcdir/ChakraCore-${pkgver}"
  ./build.sh
}

package() {
  cd "$srcdir/ChakraCore-${pkgver}/BuildLinux/Release"
  make DESTDIR="${pkgdir}" install
}

