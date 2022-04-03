# Maintainer: PolpOnline <aur at t0mmy dot anonaddy dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Ankit R Gadiya <arch@argp.in>
# Contributor: John W. Trengrove <john@retrofilter.com>

pkgname='stagit'
pkgver=1.1
pkgrel=1
pkgdesc='Static site generator for git version control'
arch=('x86_64')
url='https://codemadness.org/stagit.html'
_url_source='https://codemadness.org/releases/stagit'
license=('MIT')
depends=('libgit2')
optdepends=('git: scripting functionality')
source=("${_url_source}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('e75d47b84d2783f7396a932b402a4dd36572027931559eae908861f9b8c658f43f5110bdfc81c5a0b65be3a0c53939ba9adabcc1e36fe88a6dab54b929526e0f')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
