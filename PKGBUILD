# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=tscrape
pkgver=0.5
pkgrel=2
pkgdesc='Twitter scraper'
arch=('x86_64')
url='https://codemadness.org/tscrape.html'
license=('ISC')
source=("https://codemadness.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('826611882263959faed479589b78db01891a68e0b1e15e2d32fdacfea22af5a4')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX="/usr" MANPREFIX="/usr/share/man" -C "${pkgname}-${pkgver}" install
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et: