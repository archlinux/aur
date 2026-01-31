# Maintainer: eNV25 <env252525@gmail.com>
# Maintainer: a821 at (nospam) mail de

# previous maintainer did not leave his email

pkgname=pandoc-crossref-bin
pkgver=0.3.23
_pkgver=0.3.23
_pandoc_pkgver=3.8.3
pkgrel=1
pkgdesc="Pandoc filter for cross-references - executable only"
url="https://github.com/lierdakil/pandoc-crossref/"
license=("GPL-2.0-or-later")
arch=('x86_64' 'aarch64')
conflicts=("pandoc-crossref")
provides=("pandoc-crossref")
depends=("pandoc>=${_pandoc_pkgver}")
options=(!strip)
source_x86_64=(
    "pandoc-crossref-x64-${_pkgver}.tar.xz::https://github.com/lierdakil/pandoc-crossref/releases/download/v${_pkgver}/pandoc-crossref-Linux-X64.tar.xz"
)
source_aarch64=(
    "pandoc-crossref-arm64-${_pkgver}.tar.xz::https://github.com/lierdakil/pandoc-crossref/releases/download/v${_pkgver}/pandoc-crossref-Linux-ARM64.tar.xz"
)
sha256sums_x86_64=('6c4879a3b1dbaac39653234b22e6d2dbd53163d716db875bbc8d3a84beeb459f')
sha256sums_aarch64=('050d2b4dfd65111b6648a9662f07eaae5a5be412cdd6cfe511dd43043d70b439')

package() {
    cd "${srcdir}"
    install -Dm755 pandoc-crossref -t "${pkgdir}/usr/bin/"
    install -Dm644 pandoc-crossref.1 -t "${pkgdir}/usr/share/man/man1/"
}
