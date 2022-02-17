pkgname=yafetch
pkgver=0.0.3
pkgrel=0
pkgdesc='Commandline tool to get system information'
arch=('any')
url="https://github.com/deepjyoti30/yaf/"
license=('MIT')
makedepends=('go')
source=("https://github.com/deepjyoti30/yaf/archive/refs/tags/0.0.3.tar.gz")
provides=("yaf")
conflicts=("yaf-git")
md5sums=("SKIP")
i_pkgname=yaf

prepare(){
  cd "$i_pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$i_pkgname-$pkgver"
  go build -o build/$i_pkgname .
}

package() {
  cd "$i_pkgname-$pkgver"
  install -Dm755 build/$i_pkgname "$pkgdir"/usr/bin/$i_pkgname
}