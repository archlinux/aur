# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Maxim Logaev <maximlogaev2001ezro@gmail.com>
# Contributor: Bradan J. Wolbeck <bwolbeck@compaqdisc.com>
# Contributor: Sean Enck <enckse@gmail.com>
# Contributor: John K. Luebs <https://github.com/jkl1337>

pkgname=zasm
pkgver=4.5.0
pkgrel=1
pkgdesc="Z80/8080/Z180 assembler"
arch=('x86_64')
url="https://k1.spdns.de/Develop/Projects/zasm/Distributions/"
license=('BSD-2-Clause')
depends=('libstdc++' 'libgcc' 'glibc' 'zlib')
makedepends=('git')
provides=('zasm')
conflicts=('zasm-git')

source=("git+https://github.com/Megatokio/zasm#tag=$pkgver")
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
  cd "${srcdir}/${pkgname}"
  
  install -Dm755 zasm "${pkgdir}/usr/bin/zasm"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

