# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname=sslscan-rbsec
pkgver=2.0.0
pkgrel=1
pkgdesc="sslscan tests SSL/TLS enabled services to discover supported cipher suites"
arch=('x86_64')
url="https://github.com/rbsec/sslscan"
license=('GPL3')
makedepends=('git' 'gcc' 'make')
conflicts=('sslscan' 'sslscan-git')
source=("https://github.com/rbsec/sslscan/archive/${pkgver}.tar.gz")
sha256sums=('f582c4b1c9ff6cadde4a3130a3f721866faf6048f5b1cddd1f696dc5a6fb7921')

build() {
  cd "${srcdir}/sslscan-${pkgver}"
  make static
}

package() {
  cd "${srcdir}/sslscan-${pkgver}"
  install -D -m755 sslscan "${pkgdir}/usr/bin/sslscan"
  install -D -m664 sslscan.1 "${pkgdir}/usr/share/man/man1/sslscan.1"
  install -D -m664 LICENSE "${pkgdir}/usr/share/licenses/sslscan/LICENSE"
}
