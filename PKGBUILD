# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="kalc"
pkgname="${_pkgname}-bin"
pkgver=1.4.3
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
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-gnu")
b2sums=('268a4da7d8767aef72ff58fbc83b7ddf90e313033e048309286789047b882e5ccdc9bc3cc61e2f5c47f74410f8f4830815b04f57ec5899823d6f6585048b3711'
        '74915e048cf8b5207abf603136e7d5fcf5b8ad512cce78a2ebe3c88fc3150155893bf9824e6ed6a86414bbe4511a6bd4a42e8ec643c63353dc8eea4a44a021cd')
b2sums_x86_64=('415a222de4c40b3e007d7eb2164a3229b90bfdc8e315921e56b42fdd77887eefeee7f68ec9072fe4f64c1345f29ae7bf373586ba25306e6a5bcc0993c7b142a3')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
