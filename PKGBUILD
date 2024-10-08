# Maintainer: Roman V. <samuelmesa (at) mail (dot) com>
# Contributor: Roman V. <gexium (at) gmail (dot) com>
pkgname=python-cpyvpn
_name=${pkgname#python-}
pkgver=1.6.2
pkgrel=1
pkgdesc="cpyvpn is pure python implementation of the Checkpoint VPN client."
arch=('any')
url="https://gitlab.com/cpvpn/$_name"
license=('GPL3')
depends=('python>=3.7')
makedepends=('python-setuptools')
optdepends=('networkmanager: tun device configuration and run without root privileges')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('ad25a9087c41f0120a6d2984d65bfe9aceb6e6d4dc51dedfea7d915b543e6f71')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
