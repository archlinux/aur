pkgname=yaf
pkgver=0.0.1
pkgrel=0
pkgdesc='Commandline tool to get system information'
arch=('any')
url="https://github.com/deepjyoti30/yaf/"
license=('MIT')
makedepends=('go')
source=("https://github.com/deepjyoti30/yaf/archive/refs/tags/0.0.1.tar.gz")
provides=("${pkgname}")
conflicts=("${pkgname}-git")
md5sums=("SKIP")

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  go build -o build/$pkgname .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}