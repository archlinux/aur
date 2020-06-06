# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=tscrape
pkgver=0.5
pkgrel=1
pkgdesc="Twitter scraper"
arch=('x86_64')
url="https://codemadness.org/${pkgname}.html"
license=('custom:ISC license')
source=("https://codemadness.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")
depends=('glibc')
makedepends=('gcc-libs')
provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")
sha256sums=('826611882263959faed479589b78db01891a68e0b1e15e2d32fdacfea22af5a4')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" MANPREFIX="/usr/share/man" install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}