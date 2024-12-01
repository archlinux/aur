# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="kalc"
pkgname="${_pkgname}-bin"
pkgver=1.4.1
pkgrel=1
pkgdesc="A complex numbers, 2D/3D graphing, arbitrary precision, vector/matrix, CLI calculator with real-time output and support for units"
arch=('x86_64')
url="https://github.com/bgkillas/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
optdepends=('gnuplot: for plotting support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-gnu")
b2sums=('071cafa471fdc261fe9221c8fd64cde58e2c197b6f0e71daa0f1f6b3292330aa89520732c12747d0dc589e1102f4737acc28f75001228918a8a4f4a3ea5a99d3'
        '74915e048cf8b5207abf603136e7d5fcf5b8ad512cce78a2ebe3c88fc3150155893bf9824e6ed6a86414bbe4511a6bd4a42e8ec643c63353dc8eea4a44a021cd')
b2sums_x86_64=('a2b290971ff72e79375530b8eb74a32b8058f412f7d012f468db765fd50bf8b4c5cbc5e259eab4fe0b9f17e611efea2f720b9bb83ace1c73a3bb7fe48d6dae8c')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
