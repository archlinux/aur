# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=sfeed
pkgver=0.9.17
pkgrel=2
pkgdesc='RSS and Atom parser'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://codemadness.org/sfeed-simple-feed-parser.html'
license=('ISC')
source=("https://codemadness.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8bd1bf05915741fe44323bf92cec25ad4ad745c5909886cd8dfb0087ede4182f')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX="/usr" MANPREFIX="/usr/share/man" -C "${pkgname}-${pkgver}" install
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et: