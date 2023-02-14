# Maintainer: kmille github@androidloves.me

pkgname=riseup-vpn-configurator
pkgver=0.1.1
pkgrel=1
pkgdesc="a simple command line tool to get RiseupVPN up and running"
arch=('any')
url="https://github.com/kmille/riseup-vpn-configurator"
license=('GPL3')
makedepends=(python-build python-installer python-wheel)
depends=(openvpn openvpn-reconnect python python-jinja python-requests python-pyyaml python-pyasn1 python-pyasn1-modules python-psutil python-ping3)
source=(https://github.com/kmille/riseup-vpn-configurator/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('6fdeb7583d7fc0e2ae326c0ba90a30834e8d2942f3f55f8517710889bf900c1d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
