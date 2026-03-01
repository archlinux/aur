# Maintainer: zaoqi <zaomir@outlook.com>

pkgname=koreader-bin
pkgver=2025.10
pkgrel=3
pkgdesc="An ebook reader application supporting PDF, DjVu, EPUB, FB2 and many more formats, running on Cervantes, Kindle, Kobo, PocketBook and Android devices"
arch=("x86_64" 'aarch64')
url="https://github.com/koreader/koreader/"
license=('AGPL3')
depends=('sdl2' 'fonts-noto-hinted' 'fonts-droid-fallback')
source_x86_64=("https://github.com/koreader/koreader/releases/download/v${pkgver}/koreader-${pkgver}-amd64.deb")
source_aarch64=("https://github.com/koreader/koreader/releases/download/v${pkgver}/koreader-${pkgver}-arm64.deb")
sha256sums_x86_64=('398ccc394173533918bdc8e3317d05641919b3fffd89edf4db99618453abb7d3')
sha256sums_aarch64=('cfddac82e15ee6a70f98793e3ab9bcbc7272715799637718181c94eb121cae40')

build() {
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.zst -C "${srcdir}/dpkgdir"
}

package() {
  cp -r "${srcdir}/dpkgdir"/* "${pkgdir}"
}
