# Maintainer: Nai Erchou <naierchou@mail.ru>
pkgname=webappview-git
pkgver=0.1.0
pkgrel=0
epoch=
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgdesc="Web application runner written in go"
arch=('x86_64')
url="https://github.com/mindiae/webappview"
license=('GPL-3.0')
depends=('go' 'gtk3' 'webkit2gtk')
makedepends=('git' 'go' 'gtk3' 'webkit2gtk')
source=("git+https://gitverse.ru/naierchou/webappview.git")
sha256sums=("SKIP")

build() {
  cd "$srcdir/${pkgname%-git}"
  make build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  ./prepare
  make install BASEDIR="$pkgdir"
}
