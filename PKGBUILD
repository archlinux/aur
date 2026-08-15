# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Lauri Gustafsson <lauri at gustafla dot space>

_pkgname="zigdown"
pkgname="${_pkgname}-bin"
pkgver=1.3.1
pkgrel=1
pkgdesc="Parse and render Markdown-like content to the terminal, to HTML, or inside Neovim"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/JacobCrabill/${_pkgname}"
license=(
  'MIT'
)
depends_x86_64=(
  'glibc'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE.txt::${url}/raw/refs/tags/v${pkgver}/LICENSE.txt"
)
source_aarch64=(
  "${_pkgsrc}-aarch64-linux-musl.tar.gz::${url}/releases/download/v${pkgver}/aarch64-linux-musl.tar.gz"
)
source_x86_64=(
  "${_pkgsrc}-x86_64-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/x86_64-linux-gnu.tar.gz"
)
sha256sums=('05f51d5201ba3aa40e50f5bd15089f98953d3ced57db3cf767752405c76fc283'
            '2c8f1ee2496954366f4b020a63e97732dc9a232d5eaa43acf626322cc298dc7a')
sha256sums_aarch64=('b17ed4156a9c10dc11767480f9ffd800b8ed0c0d342c3fa458bccb1a1bc4293d')
sha256sums_x86_64=('7cd274d2cdbfc914332918e5cc909313a49659e1b00cd6ab3b7a7049fb0c5d66')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"            "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
}
