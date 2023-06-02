# Maintainer: zaoqi <zaomir@outlook.com>

pkgname=koreader-bin
pkgver=2023.05
pkgrel=1
pkgdesc="An ebook reader application supporting PDF, DjVu, EPUB, FB2 and many more formats, running on Cervantes, Kindle, Kobo, PocketBook and Android devices"
arch=("x86_64" 'aarch64')
url="https://github.com/koreader/koreader/"
license=('AGPL3')
depends=('sdl2' 'fonts-noto-hinted' 'fonts-droid-fallback')
source_x86_64=("https://github.com/koreader/koreader/releases/download/v${pkgver}/koreader-${pkgver}-amd64.deb")
source_aarch64=("https://github.com/koreader/koreader/releases/download/v${pkgver}/koreader-${pkgver}-arm64.deb")
sha256sums_x86_64=('e4b625b0d25c9bf871e37fcd7b13b989cc3cba5430a63582251318a6f3ae8b98')
sha256sums_aarch64=('a9c7ec5425214ad6542eef55db3cbcb9664dcb4046e0edb0218d0c1dd70cd14a')

build() {
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
}

package() {
  cp -r "${srcdir}/dpkgdir"/* "${pkgdir}"
}
