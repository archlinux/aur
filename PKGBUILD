# Maintainer: Ray Shirohara <RShirohara@gmail.com>

pkgname=textimg
pkgver=3.0.6
pkgrel=2
pkgdesc='Command to convert from color text (ANSI or 256) to image.'
arch=('x86_64')
url='https://github.com/jiro4989/textimg'
license=('MIT')
makedepends=('go')
provides=('textimg')
options=('!strip')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ab7ad2965a826cc576ba23f3e75e0e973e0bfcd675a6183d674badb17ba6812c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go build
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go test -cover ./...
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
