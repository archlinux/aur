# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="monocle"
pkgname="${_pkgname}-bin"
pkgver=0.6.1
pkgrel=1
pkgdesc="See through all BGP data with a monocle"
arch=('x86_64' 'aarch64')
url="https://github.com/bgpkit/${_pkgname}"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('28ae217d3e04c30e7c0c99bdc5b90231075aabe2edafb1cd1203858fba0604df'
            '2f7fe2af03db380114c5894a77181791be23b2cb12035669dfb38c09c47e104c')
sha256sums_x86_64=('2c88193fcf93006f01a43b2feb08a55d955bdb53d596f1e2db9bf6a4ada5b0de')
sha256sums_aarch64=('ad5a25c89e11288369d8aa0e787588f18336d73650bafb5392099802ce73d2fc')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}"         "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
