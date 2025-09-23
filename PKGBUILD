# Maintainer: zaoqi <zaomir@outlook.com>

pkgname=koreader-bin
pkgver=2025.08
pkgrel=3
pkgdesc="An ebook reader application supporting PDF, DjVu, EPUB, FB2 and many more formats, running on Cervantes, Kindle, Kobo, PocketBook and Android devices"
arch=("x86_64" 'aarch64')
url="https://github.com/koreader/koreader/"
license=('AGPL3')
depends=('sdl2' 'fonts-noto-hinted' 'fonts-droid-fallback')
source_x86_64=("https://github.com/koreader/koreader/releases/download/v${pkgver}/koreader-${pkgver}-amd64.deb")
source_aarch64=("https://github.com/koreader/koreader/releases/download/v${pkgver}/koreader-${pkgver}-arm64.deb")
sha256sums_x86_64=('9f341d7dcf5ba34442a5af6c187d2b73b4419d1e99d33e8d23225c62880d842c')
sha256sums_aarch64=('396853955130d528fb64113afef4ccc2debb9cffeacc18b8ed93ad519d9a05ea')

build() {
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.zst -C "${srcdir}/dpkgdir"
}

package() {
  cp -r "${srcdir}/dpkgdir"/* "${pkgdir}"
}
