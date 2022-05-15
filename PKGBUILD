# Maintainer: Yohann D'ANELLO <ynerant@crans.org>

name=woke
pkgname=woke
pkgver=0.18.2
pkgrel=1
pkgdesc="Detect non-inclusive language in your source code."
arch=('any')
url="https://getwoke.tech/"
license=('MIT')
makedepends=('go')
conflicts=('woke-bin')
source=("https://github.com/get-woke/woke/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("c0becedded5567d93f9e5275d706a0d9ddb6dee6f0138b5e2b494cb1e10eb240")

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
