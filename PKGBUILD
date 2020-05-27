# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=vpn-slice
pkgver=0.14
pkgrel=2
pkgdesc='vpnc-script replacement for easy and secure split-tunnel VPN setup'
arch=('any')
url="https://github.com/dlenski/${pkgname}"
license=('GPL3')
depends=(python python-setproctitle python-dnspython bind-tools iproute2 iptables)
makedepends=(python-setuptools)
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('5c46a31da3a6080c0182776d54f84128')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
