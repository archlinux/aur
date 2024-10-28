# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="monocle"
pkgname="${_pkgname}-bin"
pkgver=0.6.2
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
sha256sums_x86_64=('bbfb58b1f28de20d7edb2d9ee36a770464626e8ca06b6b4ad6ddb3d44e710f3c')
sha256sums_aarch64=('5d2dea1d9ee2c4fd0262c5ad42b9b470b27314127f345ac45420563a0a78bcc7')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}"         "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
