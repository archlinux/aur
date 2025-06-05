# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="kalc"
pkgname="${_pkgname}-bin"
pkgver=1.5.1
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
source_x86_64=("${_pkgsrc}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux.zip")
sha256sums=('c609575cee4b42a102b27fa8208503dcc2fc469f8b7a142f7e9636e52b207937'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('2ee54bd51f4ec8a63b1fe5a95b0f7c4c43725448110fe240a7879a6736b496f6')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
