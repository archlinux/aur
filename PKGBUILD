# Maintainer: Sean Enck <enckse@gmail.com>
# Contributor: John K. Luebs <https://github.com/jkl1337>

pkgname=zasm
pkgver=4.0.17
pkgrel=2
pkgdesc="A 2-pass assembler for the Zilog 8-bit Z80 CPU"
arch=('any')
url="http://k1.spdns.de/Develop/Projects/zasm/"
license=('BSD')
source=("git+https://k1.spdns.de/Git/zasm-4.0.git#commit=bc345236210d0a2a0bb0415e08968efca881617d"
        "git+https://k1.spdns.de/Git/Libraries.git#commit=1c6fea1a5538dfaf1ece20a53db50de00897b6f0")
sha256sums=('SKIP' 'SKIP')

build() {
  cd ${srcdir}/${pkgname}-4.0
  rm Libraries
  ln -s ../Libraries Libraries
  cd Linux
  make
}

package() {
  cd ${srcdir}/${pkgname}-4.0/Linux
  install -Dm755 zasm "${pkgdir}/usr/bin/zasm"
}
