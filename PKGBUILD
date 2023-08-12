# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=hexd
pkgver=1.1.0
pkgrel=1
pkgdesc="colourful, human-friendly hexdump tool"
arch=('i686' 'x86_64')
license=('MIT')
url="https://github.com/FireyFly/hexd"

source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('de0db7205c8eb0f170263aca27f5d48963855345bc79ba4842edd21a938d0326')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make PREFIX="${pkgdir}/usr" install

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
