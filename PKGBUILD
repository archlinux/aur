# Maintainer: Roman V. <gexium (at) gmail (dot) com>
pkgname=python-cpyvpn
_name=${pkgname#python-}
pkgver=1.6
pkgrel=1
pkgdesc="cpyvpn is pure python implementation of the Checkpoint VPN client."
arch=('any')
url="https://gitlab.com/cpvpn/$_name"
license=('GPL3')
depends=('python>=3.7')
makedepends=('python-setuptools')
optdepends=('networkmanager: tun device configuration and run without root privileges')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('952f8af31604f160ecbfe2049aa69b0b0849b1e1a5d949288c323eb246907732')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
