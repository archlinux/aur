# Maintainer: PolpOnline <aur at t0mmy dot anonaddy dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Ankit R Gadiya <arch@argp.in>
# Contributor: John W. Trengrove <john@retrofilter.com>

pkgname='stagit'
pkgver=1.0
pkgrel=1
pkgdesc='Static site generator for git version control'
arch=('x86_64')
url='https://codemadness.org/stagit.html'
_url_source='https://codemadness.org/releases/stagit'
license=('MIT')
depends=('libgit2')
optdepends=('git: scripting functionality')
source=("${_url_source}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('d18d7adadf85979f3062f0d4c41580d06f11a39c8864184d5a37822689bd372bb26139c7ae16728d71e240f90e2dbe6ce829cd27ee2ea684474974341c208813')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
