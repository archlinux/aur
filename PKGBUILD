# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="kalc"
pkgname="${_pkgname}-bin"
pkgver=1.3.3
pkgrel=1
pkgdesc="A complex numbers, 2D/3D graphing, arbitrary precision, vector/matrix, CLI calculator with real-time output and support for units"
arch=('x86_64')
url="https://github.com/bgkillas/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
optdepends=('gnuplot: for plotting support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-gnu")
b2sums=('92895095a8777201a1e5abc0cb4397561eb5f7012655c64357f28a8e4b2f6df5ca7607eab3d6697be66aab60c640cda0c5366c4e2b654a331f63adeefdb39acb'
        '74915e048cf8b5207abf603136e7d5fcf5b8ad512cce78a2ebe3c88fc3150155893bf9824e6ed6a86414bbe4511a6bd4a42e8ec643c63353dc8eea4a44a021cd')
b2sums_x86_64=('f0731daefa0f8c0e7677604cb19705056fe909dee0abb79f72286a51f95796dcf9148e0dca5a97d20e14a2eae5ed7c31999dd52a0bbca16b86ccbb556001bce7')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
