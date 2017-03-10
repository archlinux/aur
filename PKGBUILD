# Maintainer: Sean Enck <enckse@gmail.com>
# Contributor: John K. Luebs <https://github.com/jkl1337>

pkgname=zasm
pkgver=4.0.20
pkgrel=1
pkgdesc="A 2-pass assembler for the Zilog 8-bit Z80 CPU"
arch=('any')
url="http://k1.spdns.de/Develop/Projects/zasm/"
license=('BSD')
source=("git+https://k1.spdns.de/Git/zasm-4.0.git#commit=50ddb7f8cd38d2a57a07e6b4de94cc6bfe1b6af5"
        "git+https://k1.spdns.de/Git/Libraries.git#commit=ca31f4a1677d4b6c39e71bc6ac23042cc832ecf1")
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
