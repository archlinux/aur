# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='tscrape'
pkgver=0.6
pkgrel=1
pkgdesc='Twitter scraper'
arch=('x86_64')
url='https://codemadness.org/tscrape.html'
_url_source='https://codemadness.org/releases/tscrape'
license=('ISC')
source=("${_url_source}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d9cbb9ab1072f808fc29dfa69a685f959ac0afd3ec69ca11df3a0b555b0bee87')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
