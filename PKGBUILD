# Maintainer: Nai Erchou <naierchou@mail.ru>
pkgname=tserili-git
pkgver=0.0.1
pkgrel=0
epoch=
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgdesc="Bible reader for modules of MyBible mobile application"
arch=('any')
url="https://gitverse.ru/naierchou/tserili"
license=('GPL-3.0')
depends=('mybible-module-kjv' 'webappview-git')
optdepends=('mybible-module-pbti' 'mybible-module-ogb' 'mybible-module-rst')
makedepends=()
source=("git+https://gitverse.ru/naierchou/tserili.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git rev-parse --short HEAD
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make install BASEDIR="$pkgdir"
}
