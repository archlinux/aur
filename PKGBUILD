# Maintainer: Emmy D'Anello <ynerant@crans.org>

name=woke
pkgname=woke
pkgver=0.19.0
pkgrel=1
pkgdesc="Detect non-inclusive language in your source code."
arch=('any')
url="https://getwoke.tech/"
license=('MIT')
makedepends=('go')
conflicts=('woke-bin')
source=("https://github.com/get-woke/woke/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("d17c7e4e846a409af14e65a001d2ddb1657fd82f562704e0c10ced4dadcfd31c")

build() {
  cd $name-$pkgver
  mkdir -p bin
  go build -o bin/
}

package() {
  cd $name-$pkgver
  install -vDm 755 bin/${name} -t "${pkgdir}/usr/bin"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
