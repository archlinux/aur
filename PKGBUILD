# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname=sslscan-rbsec
pkgver=1.11.13
pkgrel=1
pkgdesc="sslscan tests SSL/TLS enabled services to discover supported cipher suites"
arch=('x86_64')
url="https://github.com/rbsec/sslscan"
license=('GPL3')
makedepends=('git' 'gcc' 'make')
conflicts=('sslscan' 'sslscan-git')
source=("https://github.com/rbsec/sslscan/archive/${pkgver}-rbsec.tar.gz")
sha256sums=('8a09c4cd1400af2eeeec8436a2f645ed0aae5576f4de045a09ea9ff099f56f4a')

build() {
  cd "${srcdir}/sslscan-${pkgver}-rbsec"
  make static
}

package() {
  cd "${srcdir}/sslscan-${pkgver}-rbsec"
  install -D -m755 sslscan "${pkgdir}/usr/bin/sslscan"
  install -D -m664 sslscan.1 "${pkgdir}/usr/share/man/man1/sslscan.1"
  install -D -m664 LICENSE "${pkgdir}/usr/share/licenses/sslscan/LICENSE"
}
