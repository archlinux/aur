# Maintainer: PolpOnline <aur at t0mmy dot anonaddy dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Ankit R Gadiya <arch@argp.in>
# Contributor: John W. Trengrove <john@retrofilter.com>

pkgname='stagit'
pkgver=0.9.6
pkgrel=1
pkgdesc='Static site generator for git version control'
arch=('x86_64')
url='https://codemadness.org/stagit.html'
_url_source='https://codemadness.org/releases/stagit'
license=('MIT')
depends=('libgit2')
optdepends=('git: scripting functionality')
source=("${_url_source}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('d9f0cdb67ed0e6355f0485e36cc81136d7f21d73a35010faf41f2c967ff462ca948b2b8d2e6ce226a065969636d1ffc5603ef8da2c86598b861bd6c7c2f0d368')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
