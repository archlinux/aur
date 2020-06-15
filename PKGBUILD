# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=stagit-gopher
pkgver=0.9.3
pkgrel=1
pkgdesc='Static gopher site generator for git version control'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://codemadness.org/stagit-gopher.html'
license=('MIT')
depends=('libgit2')
optdepends=('geomyidae: small c-based gopherd'
            'git: scripting functionality')
source=("https://codemadness.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('fb8cba96e8ea809b1bf0bfa5aed17fedca1245ed7747c1fc6c855c54bedaba04')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX="/usr" MANPREFIX="/usr/share/man" -C "${pkgname}-${pkgver}" install
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et: