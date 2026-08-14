# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="monocle"
pkgname="${_pkgname}-bin"
pkgver=1.4.0
pkgrel=1
pkgdesc="See through all BGP data with a monocle"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/bgpkit/${_pkgname}"
license=(
  'MIT'
)
depends=(
  'glibc'
  'libgcc'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz"
)
source_x86_64=(
  "${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums=('8f9e4664db31640070ab223026c192984d77b2078fa9b8479773d1f76625d375'
            '2f7fe2af03db380114c5894a77181791be23b2cb12035669dfb38c09c47e104c')
sha256sums_aarch64=('da2bb0c2f1abc767e4a0561e3baecc433777cf2596e2e569434e87d959c6a0c3')
sha256sums_x86_64=('067e7e375934fa602f99a2da6cf8fc434b7084062402c5c19fd75bd887f36921')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
