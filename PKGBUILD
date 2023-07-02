# Maintainer: zaoqi <zaomir@outlook.com>

pkgname=koreader-bin
pkgver=2023.06
pkgrel=1
pkgdesc="An ebook reader application supporting PDF, DjVu, EPUB, FB2 and many more formats, running on Cervantes, Kindle, Kobo, PocketBook and Android devices"
arch=("x86_64" 'aarch64')
url="https://github.com/koreader/koreader/"
license=('AGPL3')
depends=('sdl2' 'fonts-noto-hinted' 'fonts-droid-fallback')
source_x86_64=("https://github.com/koreader/koreader/releases/download/v${pkgver}/koreader-${pkgver}-amd64.deb")
source_aarch64=("https://github.com/koreader/koreader/releases/download/v${pkgver}/koreader-${pkgver}-arm64.deb")
sha256sums_x86_64=('4d94a7721cd7d609f243a9b366f2c6a30d5cfac53c490119eb2d8b8c6dbccc41')
sha256sums_aarch64=('48d7b0f9bfe7ffcc25bda978faa4674a2d11b6f9cf01b3401a8ae8d2b4c22da0')

build() {
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
}

package() {
  cp -r "${srcdir}/dpkgdir"/* "${pkgdir}"
}
