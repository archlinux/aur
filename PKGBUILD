# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: quellen <lodgerz@gmail.com>

pkgname=epub2txt
pkgver=2.01
pkgrel=1
pkgdesc='Extract text from EPUB documents'
arch=('x86_64')
url='https://github.com/kevinboone/epub2txt2'
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('82c96c713c8a6e10d7b37e96db83a9d5f50fcb4b65034b4a1df1024776b6591f')

build() {
  make -C "${pkgname}2-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" -C "${pkgname}2-${pkgver}" install
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}2-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
