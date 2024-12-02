# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="tenere"
pkgname="${_pkgname}-bin"
pkgver=0.11.2
pkgrel=1
pkgdesc="TUI interface for LLMs written in Rust"
arch=('x86_64')
url="https://github.com/pythops/${_pkgname}"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu")
b2sums=('c7a433105d08b41b927927d161e96e871b34ddbd47bf53649dd157818119edd57017a4d569e5fe355d76602587b42c3288a67fcc43911e7638fde03ed982b08e'
        '74915e048cf8b5207abf603136e7d5fcf5b8ad512cce78a2ebe3c88fc3150155893bf9824e6ed6a86414bbe4511a6bd4a42e8ec643c63353dc8eea4a44a021cd')
b2sums_x86_64=('969f49748f124fd1e34a567f60887da03c8e8c153c735218f43e0e0fcfc2e943e9210ddcea34f07ab40454a39905729bb1332f535ebd67a5a0efbbe6e482ff1d')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
