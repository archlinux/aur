# Maintainer: zaoqi <zaomir@outlook.com>

pkgname=koreader-bin
pkgver=2021.11
pkgrel=1
pkgdesc="An ebook reader application supporting PDF, DjVu, EPUB, FB2 and many more formats, running on Cervantes, Kindle, Kobo, PocketBook and Android devices"
arch=("x86_64")
url="https://github.com/koreader/koreader/"
license=('AGPL3')
depends=('sdl2' 'fonts-noto-hinted' 'fonts-droid-fallback')
source=(
  "https://github.com/koreader/koreader/releases/download/v${pkgver}/koreader-${pkgver}-amd64.deb")
sha512sums=('811adc6a6fb4fef2ed9bb00ceb41b4c4d0cad9e024cb19021c9fad3d1f7dc06e8105fbb0f8410464576b0436e04e3c60e852db32d8c89bc14adf3a36f93223da')

build() {
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
}

package() {
  cp -r "${srcdir}/dpkgdir"/* "${pkgdir}"
}
