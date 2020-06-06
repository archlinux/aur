# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Ankit R Gadiya <arch@argp.in>
# Contributor: John W. Trengrove <john@retrofilter.com>

pkgname=stagit
pkgver=0.9.3
pkgrel=1
pkgdesc="static git page generator"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://codemadness.org/${pkgname}.html"
license=('custom:MIT/X Consortium')
source=("https://codemadness.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")
depends=('libgit2')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")
sha256sums=('db89b41c6d3803b2562d56fee0d939360fc887902f17aaf27dff774df0402da3')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" MANPREFIX="/usr/share/man" install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
