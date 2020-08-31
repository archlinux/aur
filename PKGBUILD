# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='ebookinfo'
pkgver=0.0.1
pkgrel=1
pkgdesc='Library and utility for extracting meta-data from certain e-book files'
arch=('x86_64')
url='https://github.com/kevinboone/ebookinfo'
license=('GPL3')
depends=('pcre')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9483677519460f4f5766f2b5cd772578bdecfb9dc8c99cdb91084bf1325e33c0')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 -t "${pkgdir}/usr/bin" "${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/man/man1" "man1/${pkgname}.1"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'
}

# vim: ts=2 sw=2 et:
