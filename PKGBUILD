# Maintainer: zaoqi <zaomir@outlook.com>

pkgname=koreader
pkgver=2019.06
pkgrel=2
pkgdesc="An ebook reader application supporting PDF, DjVu, EPUB, FB2 and many more formats, running on Cervantes, Kindle, Kobo, PocketBook and Android devices"
arch=("x86_64")
url="https://github.com/koreader/koreader/"
license=('AGPL3')
depends=('sdl2')
source=("LICENSE"
  "https://github.com/koreader/koreader/releases/download/v2019.06/koreader-2019.06-amd64.deb")
sha512sums=('5c4c4e351be428767a0f30cde8bf2687bc31580c408c4b8c6e3a6cf9e4fa0412aabb9037f216e46ad93b85481941dcabe726c1da3714ab5a737be71b12d2ff2d'
  'a9e06495a5334a56a239c86c73c8cd59390173d3d17da3b0d9fbf4596af83c6d463f4d78672710793828ee4d2387fd3ea87583356a35fbe4e34413d83e0cfb5c')

build() {
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
}

package() {
  cp -r "${srcdir}/dpkgdir"/* "${pkgdir}"/
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
