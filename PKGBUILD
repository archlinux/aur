# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Ankit R Gadiya <arch@argp.in>
# Contributor: John W. Trengrove <john@retrofilter.com>

pkgname='stagit'
pkgver=0.9.4
pkgrel=1
pkgdesc='Static site generator for git version control'
arch=('x86_64')
url='https://codemadness.org/stagit.html'
_url_source='https://codemadness.org/releases/stagit'
license=('MIT')
depends=('libgit2')
optdepends=('git: scripting functionality')
source=("${_url_source}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8889ab13fa345729cdc3cc92c8fdce10d49f6660f39a60def7646c86d8a61300')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
