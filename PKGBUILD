# Maintainer: zaoqi <zaomir@outlook.com>

pkgname=koreader-bin
pkgver=2022.05
pkgrel=1
pkgdesc="An ebook reader application supporting PDF, DjVu, EPUB, FB2 and many more formats, running on Cervantes, Kindle, Kobo, PocketBook and Android devices"
arch=("x86_64")
url="https://github.com/koreader/koreader/"
license=('AGPL3')
depends=('sdl2' 'fonts-noto-hinted' 'fonts-droid-fallback')
source=(
  "https://github.com/koreader/koreader/releases/download/v${pkgver}/koreader-${pkgver}-amd64.deb")
sha512sums=('e28bb87365ff4fc5894b7328a18f48eccdc90a4eeead44608716ea511de237fb8e98eb60e6f21367439a2cffde98c9192e27f3937025a7797b738ac23ffee755')

build() {
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
}

package() {
  cp -r "${srcdir}/dpkgdir"/* "${pkgdir}"
}
