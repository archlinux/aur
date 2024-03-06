# Maintainer: zaoqi <zaomir@outlook.com>

pkgname=koreader-bin
pkgver=2024.03.1
pkgrel=1
pkgdesc="An ebook reader application supporting PDF, DjVu, EPUB, FB2 and many more formats, running on Cervantes, Kindle, Kobo, PocketBook and Android devices"
arch=("x86_64" 'aarch64')
url="https://github.com/koreader/koreader/"
license=('AGPL3')
depends=('sdl2' 'fonts-noto-hinted' 'fonts-droid-fallback')
source_x86_64=("https://github.com/koreader/koreader/releases/download/v${pkgver}/koreader-${pkgver}-amd64.deb")
source_aarch64=("https://github.com/koreader/koreader/releases/download/v${pkgver}/koreader-${pkgver}-arm64.deb")
sha256sums_x86_64=('119de2aa9d00d81670237e379efbe9ef5446431e853deb14072e0b85ae18cf85')
sha256sums_aarch64=('f41bbe9967c9b8f687e6757bd4932b7068a989959f71fd7d29f55ab825bddbe2')

build() {
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
}

package() {
  cp -r "${srcdir}/dpkgdir"/* "${pkgdir}"
}
