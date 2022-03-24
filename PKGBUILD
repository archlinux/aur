# Maintainer: zaoqi <zaomir@outlook.com>

pkgname=koreader-bin
pkgver=2022.03.1
pkgrel=1
pkgdesc="An ebook reader application supporting PDF, DjVu, EPUB, FB2 and many more formats, running on Cervantes, Kindle, Kobo, PocketBook and Android devices"
arch=("x86_64")
url="https://github.com/koreader/koreader/"
license=('AGPL3')
depends=('sdl2' 'fonts-noto-hinted' 'fonts-droid-fallback')
source=(
  "https://github.com/koreader/koreader/releases/download/v${pkgver}/koreader-${pkgver}-amd64.deb")
sha512sums=('9824bbb644805e095525e019a3a4c6dc797291077e7d704ba54bfcadf77e371fcd15faa01aeca49481c0f765b76ec6a544528428cfa597c46c1819ff396b590d')

build() {
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
}

package() {
  cp -r "${srcdir}/dpkgdir"/* "${pkgdir}"
}
