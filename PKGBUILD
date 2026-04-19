# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Lauri Gustafsson <lauri at gustafla dot space>

_pkgname="zigdown"
pkgname="${_pkgname}-bin"
pkgver=1.2.1
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
sha256sums=('53482fc32d9d0ab0dccb16eeb7b7f98bb804c2d946f8111b848298304ee815c2'
            '2c8f1ee2496954366f4b020a63e97732dc9a232d5eaa43acf626322cc298dc7a')
sha256sums_aarch64=('b9b1b39575b74a952733bd76b1ac7258444f6448fa0a97810c460abad81dd06c')
sha256sums_x86_64=('b9220cd8dcf9111be4fda7320241385f94e3ac77254317165035999029a4a8df')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"            "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
}
