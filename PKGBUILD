# Maintainer: PolpOnline <aur at t0mmy dot anonaddy dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Ankit R Gadiya <arch@argp.in>
# Contributor: John W. Trengrove <john@retrofilter.com>

pkgname='stagit'
pkgver=1.2
pkgrel=1
pkgdesc='Static site generator for git version control'
arch=('x86_64')
url='https://codemadness.org/stagit.html'
_url_source='https://codemadness.org/releases/stagit'
license=('MIT')
depends=('libgit2')
optdepends=('git: scripting functionality')
source=("${_url_source}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('f9d9f157145b47a14b5ff098e3db261b4739145e5e7cf2a273e188fc8617681dc9b7b9737de2182334bb9a50bef061ebee452ccbc1e013e14f2ef8c4a4c32d0b')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
