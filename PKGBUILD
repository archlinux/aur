# Maintainer: Ethan Brittain-Morby <ebm539 at protonmail dot com>
pkgname=dsvpn
pkgver=0.1.2
pkgrel=1
pkgdesc="A Dead Simple VPN."
arch=('any')
url="https://github.com/jedisct1/dsvpn"
license=('MIT')
depends=('iproute2' 'gawk' 'iptables' 'procps-ng')
makedepends=('make' 'gcc')
provides=(${pkgname}-git)
conflicts=(${pkgname}-git)
source=("https://github.com/jedisct1/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('6e92fbf82c527471c3836f201cc0dc6da9850afc7bffb4f9fce88b2588611dc3')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

