# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='stagit-gopher'
pkgver=0.9.4
pkgrel=1
pkgdesc='Static gopher site generator for git version control'
arch=('x86_64')
url='https://codemadness.org/stagit-gopher.html'
_url_source='https://codemadness.org/releases/stagit-gopher'
license=('MIT')
depends=('libgit2')
optdepends=('geomyidae: small c-based gopherd'
            'git: scripting functionality')
source=("${_url_source}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('afcbf4ddcd88454ff239b892365f5b0df8de442474e06b60adb0f94d45a3cd73')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
