# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Ankit R Gadiya <arch@argp.in>
# Contributor: John W. Trengrove <john@retrofilter.com>

pkgname=stagit
pkgver=0.9.3
pkgrel=1
pkgdesc="static git page generator"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://codemadness.org/stagit.html"
license=('custom:MIT/X Consortium')
source=("https://codemadness.org/releases/stagit/stagit-${pkgver}.tar.gz")
depends=('libgit2')
makedepends=('git')
sha256sums=('db89b41c6d3803b2562d56fee0d939360fc887902f17aaf27dff774df0402da3')

build() {
  cd "stagit-${pkgver}"
  make
}

package() {
  cd "stagit-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" MANPREFIX="/usr/share/man" install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
