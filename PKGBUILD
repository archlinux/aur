# Maintainer: zaoqi <zaomir@outlook.com>

pkgname=koreader-bin
pkgver=2024.07
pkgrel=2
pkgdesc="An ebook reader application supporting PDF, DjVu, EPUB, FB2 and many more formats, running on Cervantes, Kindle, Kobo, PocketBook and Android devices"
arch=("x86_64" 'aarch64')
url="https://github.com/koreader/koreader/"
license=('AGPL3')
depends=('sdl2' 'fonts-noto-hinted' 'fonts-droid-fallback')
source_x86_64=("https://github.com/koreader/koreader/releases/download/v${pkgver}/koreader-${pkgver}-amd64.deb")
source_aarch64=("https://github.com/koreader/koreader/releases/download/v${pkgver}/koreader-${pkgver}-arm64.deb")
sha256sums_x86_64=('5ecf428b96b7167b51c1bea4927d5d08687ada98e3fd3175e78206d6e883a514')
sha256sums_aarch64=('2ab918d654f0abc988a26514090f4abdf66a8a727be18f3a7e43dec6c16238f8')

build() {
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.zst -C "${srcdir}/dpkgdir"
}

package() {
  cp -r "${srcdir}/dpkgdir"/* "${pkgdir}"
}
