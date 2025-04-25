# Maintainer: Nai Erchou <naierchou@mail.ru>
pkgname=webappview-git
pkgver=0.0.1
pkgrel=0
epoch=
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgdesc="Web application runner and source inspector for javascript and html files"
arch=('x86_64')
url="https://gitverse.ru/naierchou/webappview"
license=('GPL-3.0')
depends=('go' 'gtk3' 'webkit2gtk' 'bash' 'lua')
makedepends=('git' 'go' 'gtk3' 'webkit2gtk')
source=("git+https://gitverse.ru/naierchou/webappview.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git rev-parse --short HEAD
}

build() {
  cd "$srcdir/${pkgname%-git}"
  ./prepare
  make build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make install BASEDIR="$pkgdir"
}
