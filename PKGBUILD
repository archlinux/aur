# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='tscrape'
pkgver=0.6
pkgrel=1
pkgdesc='Twitter scraper'
arch=('x86_64')
url='https://codemadness.org/tscrape.html'
license=('ISC')
source=("${url%/*}/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d9cbb9ab1072f808fc29dfa69a685f959ac0afd3ec69ca11df3a0b555b0bee87')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX="/usr" MANPREFIX="/usr/share/man" -C "${pkgname}-${pkgver}" install
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgname}-${pkgver}/LICENSE"
}

# vim: ts=2 sw=2 et:
