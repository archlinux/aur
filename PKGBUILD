# Maintainer: eNV25 <env252525@gmail.com>
# Maintainer: a821 at (nospam) mail de

# previous maintainer did not leave his email

pkgname=pandoc-crossref-bin
pkgver=0.3.26.a
_pkgver=0.3.26a
_pandoc_pkgver=3.13
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
sha256sums_x86_64=('e61fc62485bd432c0662c2508eb40a9e501d0f47a90736995793ad73e3c0c017')
sha256sums_aarch64=('2c607d8e09b97b6efca21378ab16b330ae303eb22f604789f209fff3ada2229f')

package() {
    cd "${srcdir}"
    install -Dm755 pandoc-crossref -t "${pkgdir}/usr/bin/"
    install -Dm644 pandoc-crossref.1 -t "${pkgdir}/usr/share/man/man1/"
}
