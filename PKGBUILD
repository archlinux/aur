# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=vpn-slice
pkgver=0.16.1
pkgrel=1
pkgdesc='vpnc-script replacement for easy and secure split-tunnel VPN setup'
arch=('any')
url="https://github.com/dlenski/${pkgname}"
license=('GPL3')
depends=(python python-dnspython iproute2 iptables)
makedepends=(python-setuptools)
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('8b49c04cfb70d27dffd6348438c25e8826cf272d3de197fc75a1d2275ddbf4bb5cccbeb1ba52886641afd7743d2fd40b2d0a7b8780bb80233250db25b8fdbaf0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
