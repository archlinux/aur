_pkgname=texlab
pkgname=${_pkgname}-bin
pkgver=5.23.1
pkgrel=2
arch=('aarch64' 'armv7h' 'x86_64')
pkgdesc='A cross-platform implementation of the Language Server Protocol for LaTeX'
provides=('texlab')
conflicts=('texlab' 'texlab-git')
depends=('gcc-libs')
url='https://github.com/latex-lsp/texlab'
license=('GPL-3.0')
source=("https://raw.githubusercontent.com/latex-lsp/texlab/v${pkgver}/LICENSE")
source_aarch64=("https://github.com/latex-lsp/texlab/releases/download/v${pkgver}/texlab-${CARCH}-linux.tar.gz")
source_armv7h=("${source_aarch64[@]}")
source_x86_64=("${source_aarch64[@]}")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_aarch64=('7d881f5af7295c8c23eac8c7c7fc8708df38802d9fef582131ccbcd7d2244c69')
sha256sums_armv7h=('99d5181e32d94b4b8941b45cc6916d96dfed13a2778371da51f2ad8712d2ed9a')
sha256sums_x86_64=('73655db906ec9885a550950b092801d3e8ab56f5f057f95698370295665db331')

package() {
  install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
