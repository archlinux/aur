# Maintainer: zaoqi <zaomir@outlook.com>

pkgname=koreader-bin
pkgver=2021.10.1
pkgrel=2
pkgdesc="An ebook reader application supporting PDF, DjVu, EPUB, FB2 and many more formats, running on Cervantes, Kindle, Kobo, PocketBook and Android devices"
arch=("x86_64")
url="https://github.com/koreader/koreader/"
license=('AGPL3')
depends=('sdl2' 'fonts-noto-hinted' 'fonts-droid-fallback')
source=(
  "https://github.com/koreader/koreader/releases/download/v${pkgver}/koreader-${pkgver}-amd64.deb")
sha512sums=('47aed12db05dbead5881661dd6c5b77398f7e8a9fce19af9441ce98898ee0ab22b3c5de4729d5651029b540a1f2e84d92fd0c6a0d041fb1d5c2c4a7ff2469c89')

build() {
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
}

package() {
  cp -r "${srcdir}/dpkgdir"/* "${pkgdir}"
}
