# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname=sslscan-rbsec
pkgver=2.0.5
pkgrel=1
pkgdesc="sslscan tests SSL/TLS enabled services to discover supported cipher suites"
arch=('x86_64')
url="https://github.com/rbsec/sslscan"
license=('GPL3')
makedepends=('git' 'gcc' 'make')
conflicts=('sslscan' 'sslscan-git')
source=("https://github.com/rbsec/sslscan/archive/${pkgver}.tar.gz")
sha256sums=('34a557a7996bb5c2f69fe512b7ef14ba272094178e76140535e50691bf934f99')

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
