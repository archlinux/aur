# Maintainer: zaoqi <zaomir@outlook.com>

pkgname=koreader-bin
pkgver=2022.07
pkgrel=1
pkgdesc="An ebook reader application supporting PDF, DjVu, EPUB, FB2 and many more formats, running on Cervantes, Kindle, Kobo, PocketBook and Android devices"
arch=("x86_64")
url="https://github.com/koreader/koreader/"
license=('AGPL3')
depends=('sdl2' 'fonts-noto-hinted' 'fonts-droid-fallback')
source=(
  "https://github.com/koreader/koreader/releases/download/v${pkgver}/koreader-${pkgver}-amd64.deb")
sha512sums=('9a6b769f4d880c74af073942f472b6ac13c73cc5e14cc64c9579a6d391a43f0ed4e5f33f74d634d51f7b160f85e05e6187b7ae18b370d84ef12cea571493d713')

build() {
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
}

package() {
  cp -r "${srcdir}/dpkgdir"/* "${pkgdir}"
}
