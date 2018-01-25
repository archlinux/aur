# Maintainer: Alif Rachmawadi <arch@subosito.com>

pkgname=dep-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Go dependency management tool"
arch=('x86_64' 'i686')
url="https://github.com/golang/dep"
license=('BSD')
conflicts=('dep')
provides=('dep')
source=("LICENSE")
source_i686=("${url}/releases/download/v${pkgver}/dep-linux-386")
source_x86_64=("${url}/releases/download/v${pkgver}/dep-linux-amd64")
sha256sums=("69c47f09a7aec01c59ff1bdc346406d36e84df11461fb2bed92b0d185a7a2ccb")
sha256sums_i686=("7eecbc4f08f78215a1dbe87af761db1b546ebfea1b60c26e87105e6f63dd6335")
sha256sums_x86_64=("31144e465e52ffbc0035248a10ddea61a09bf28b00784fd3fdd9882c8cbb2315")

package() {
  if [ "${CARCH}" == "x86_64" ]; then
    install -Dm755 "${srcdir}/dep-linux-amd64" "${pkgdir}/usr/bin/dep"
  else
    install -Dm755 "${srcdir}/dep-linux-386" "${pkgdir}/usr/bin/dep"
  fi

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
