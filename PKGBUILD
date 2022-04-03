# Maintainer: PolpOnline <aur at t0mmy dot anonaddy dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='stagit-gopher'
pkgver=1.1
pkgrel=1
pkgdesc='Static gopher site generator for git version control'
arch=('x86_64')
url='https://codemadness.org/stagit-gopher.html'
_url_source='https://codemadness.org/releases/stagit-gopher'
license=('MIT')
depends=('libgit2')
optdepends=(
  'geomyidae: small c-based gopherd'
  'git: scripting functionality'
)
source=("${_url_source}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('37703a22e07bbda33a7d8684f08200cb8f69609d38966f5983d30564a0bd2478d441eb8398a1c8568cc823f1e15067624094c88ecc5271cbe51fe2e67293c224')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
