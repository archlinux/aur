# Maintainer: eNV25 <env252525@gmail.com>
# Maintainer: a821 at (nospam) mail de

# previous maintainer did not leave his email

pkgname=pandoc-crossref-bin
pkgver=0.3.22
_pkgver=0.3.22
_pandoc_pkgver=3.8.2
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
sha256sums_x86_64=('401b8aa8dcdfe1ea5a3939353bdab2a76bc4198d3ccc3cadec1c9181f8f65377')
sha256sums_aarch64=('af2bc788dd60fd0bf25ea5e61e7f0e92825ef9ee5b868cfc1c72395f9216ab17')

package() {
    cd "${srcdir}"
    install -Dm755 pandoc-crossref -t "${pkgdir}/usr/bin/"
    install -Dm644 pandoc-crossref.1 -t "${pkgdir}/usr/share/man/man1/"
}
