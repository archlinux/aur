# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=sfeed
pkgver=0.9.17
pkgrel=1
pkgdesc="RSS and Atom parser"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://codemadness.org/sfeed-simple-feed-parser.html"
license=('custom:ISC license')
source=("https://codemadness.org/releases/sfeed/sfeed-${pkgver}.tar.gz")
depends=('glibc')
makedepends=('gcc-libs')
provides=('sfeed')
conflicts=('sfeed')
sha256sums=('8bd1bf05915741fe44323bf92cec25ad4ad745c5909886cd8dfb0087ede4182f')

build() {
  cd "sfeed-${pkgver}"
  make
}

package() {
  cd "sfeed-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" MANPREFIX="/usr/share/man" install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}