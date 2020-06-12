# Maintainer: Ethan Brittain-Morby <ebm539 at protonmail dot com>
pkgname=dsvpn
pkgver=0.1.4
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
sha256sums=('b98604e1ca2ffa7a909bf07ca7cf0597e3baa73c116fbd257f93a4249ac9c0c5')

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

