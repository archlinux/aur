# Maintainer: PolpOnline <aur at t0mmy dot anonaddy dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='stagit-gopher'
pkgver=1.0
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
sha512sums=('25262a61f8b7638c31930649d95f24bf9fed72d513541436885eb0b08f096e9cd1814c85934bd163b164a2902d7afe828169cf51fb2b999ee253acf56c7cbe23')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
