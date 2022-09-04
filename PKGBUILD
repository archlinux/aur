# Maintainer: PolpOnline <aur at t0mmy dot anonaddy dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='stagit-gopher'
pkgver=1.2
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
sha512sums=('07a21862471134c1cc02350627e336fc30f2a6dce97758fc5bb3a04ac8aafe1c3227003f8dd83e330bc257a3b05374b603cd700e0244c6eb45e2dec3676621ac')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
