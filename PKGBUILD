# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Lauri Gustafsson <lauri at gustafla dot space>

_pkgname="zigdown"
pkgname="${_pkgname}-bin"
pkgver=1.2.2
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
sha256sums=('d6d25a7797873aee749bb870eb535398f6d4b15ed3b1275340f28bfa517ba5bf'
            '2c8f1ee2496954366f4b020a63e97732dc9a232d5eaa43acf626322cc298dc7a')
sha256sums_aarch64=('76a099197121a6984a304badd751cd171ecc233020c2718db28111a8d026dbaa')
sha256sums_x86_64=('2bd1a3a8cf37aa9f235271ae9c892180008b948fed0e7be555352efe97fa97f3')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"            "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
}
