# Maintainer: Maxim Logaev <maximlogaev2001ezro@gmail.com>
# Previous maintainer: Bradan J. Wolbeck <bwolbeck@compaqdisc.com>
# Contributor: Sean Enck <enckse@gmail.com>
# Contributor: John K. Luebs <https://github.com/jkl1337>

pkgname=zasm
pkgver=4.4.13
pkgrel=1
pkgdesc="Z80/8080/Z180 assembler"
arch=('any')
url="https://k1.spdns.de/Develop/Projects/zasm/Distributions/"
license=('BSD')
source=("git+https://github.com/Megatokio/zasm#tag=$pkgver")
provides=('zasm')
depends=('zlib')
makedepends=('git')
conflicts=('zasm-git')
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule init
  git submodule update
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  install -Dm755 "${srcdir}/${pkgname}/zasm" "${pkgdir}/usr/bin/zasm"
}

