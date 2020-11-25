# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=vpn-slice
pkgver=0.15
pkgrel=1
pkgdesc='vpnc-script replacement for easy and secure split-tunnel VPN setup'
arch=('any')
url="https://github.com/dlenski/${pkgname}"
license=('GPL3')
depends=(python python-setproctitle python-dnspython bind-tools iproute2 iptables)
makedepends=(python-setuptools)
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('a64e87e93a5021df84064d24cab175df')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
