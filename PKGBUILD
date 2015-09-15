# Maintainer: Javier Tia <javier dot tia at gmail dot com>
pkgname=sift
pkgver=0.3.2
pkgrel=1
pkgdesc="A fast and powerful open source alternative to grep"
arch=('i686' 'x86_64')
url="http://sift-tool.org/"
license=('GPL3')
makedepends=('go')
options=('!strip' '!emptydirs')
conflicts=('sift-bin')
replaces=('sift-bin')
source=("https://github.com/svent/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c14025e993f47a947ed9d1b444e3b3f334090428eb25736eae5779b19a764308')

build() {
  cd "${pkgname}-${pkgver}"

  go build
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm 775 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
