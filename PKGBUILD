# Maintainer: eNV25 <env252525@gmail.com>
# Maintainer: a821 at (nospam) mail de

# previous maintainer did not leave his email

pkgname=pandoc-crossref-bin
pkgver=0.3.24.a
_pkgver=0.3.24a
_pandoc_pkgver=3.9.0.2
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
sha256sums_x86_64=('afaa8867ab8d908b7e5ad1b96f62eedea6a5d3e89ee14e152cd72e67f535a728')
sha256sums_aarch64=('b3e2c10321c142f561bb20f98824a8e2e41385118a22fd2168b55e7699be69b6')

package() {
    cd "${srcdir}"
    install -Dm755 pandoc-crossref -t "${pkgdir}/usr/bin/"
    install -Dm644 pandoc-crossref.1 -t "${pkgdir}/usr/share/man/man1/"
}
