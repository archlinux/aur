# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=sfeed
pkgver=0.9.18
pkgrel=2
pkgdesc='RSS and Atom parser'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://codemadness.org/sfeed-simple-feed-parser.html'
license=('ISC')
source=("https://codemadness.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7b7a26aa9efcca2af1550135ead3baba1a9f4bf3fd10b9d396a42e7ce0fa9089')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX="/usr" MANPREFIX="/usr/share/man" -C "${pkgname}-${pkgver}" install
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
