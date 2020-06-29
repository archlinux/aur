pkgname=blink1
pkgver=2.1.0
pkgrel=1
pkgdesc='software for blink(1) USB RGB LED'
arch=('i686' 'x86_64')
url='https://github.com/todbot/blink1-tool/'
license=('GPL')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/todbot/blink1-tool/archive/v${pkgver}.tar.gz")
source=("git+https://github.com/todbot/blink1-tool.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}-tool"
  git submodule init
  git submodule update
}

build() {
  cd "${srcdir}/${pkgname}-tool"
  make
}

package() {
  # binary
  install -D -m0755 "${srcdir}/${pkgname}-tool/blink1-tool" "${pkgdir}/usr/bin/blink1-tool"
}
