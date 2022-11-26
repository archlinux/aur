# Maintainer: Roman V. <gexium (at) gmail (dot) com>
pkgname=python-cpyvpn
_name=${pkgname#python-}
pkgver=1.5.3
pkgrel=1
pkgdesc="cpyvpn is pure python implementation of the Checkpoint VPN client."
arch=('any')
url="https://gitlab.com/cpvpn/$_name"
license=('GPL3')
depends=('python>=3.7')
makedepends=('python-setuptools')
optdepends=('networkmanager: tun device configuration and run without root privileges')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('7b19bda43c8d1a69f024c72af95b8a6cfc000640d11df2b5b9f309d4d05fec5a')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
