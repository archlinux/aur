# Maintainer: Matt Parnell <parwok@gmail.com>

pkgname=vpn-slice-git
pkgver=0.4.1.1.g5064276
pkgrel=2
pkgdesc="Python based vpnc-script replacement for easy and secure split-tunnel VPN setup"
arch=('any')
url="https://github.com/dlenski/vpn-slice"
license=('GPL')
makedepends=('python-setuptools')
depends=('python' 'bind-tools' 'iproute2' 'iptables')
source=(git://github.com/dlenski/vpn-slice)
sha512sums=('SKIP')

pkgver() {
	cd vpn-slice
	echo $(git describe --tags|sed -e 's/\-/\./g')
}

build() {
  cd "$srcdir/vpn-slice"
  python setup.py build
}

package() {
  cd "$srcdir/vpn-slice"
  python setup.py install --root="$pkgdir"
}
