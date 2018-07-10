# $Id$
# Contributor: Paul Nicholson <brenix@gmail.com>

_name=openpyn
pkgname=openpyn-nordvpn
pkgver=2.2.0
pkgrel=2
pkgdesc="Easily connect to and switch between OpenVPN servers hosted by NordVPN"
provides=('python-openpyn' 'openpyn-nordvpn')
arch=('any')
url="https://github.com/jotyGill/openpyn-nordvpn"
license=('GPLv3')
depends=('openvpn' 'systemd' 'python-requests' 'python-colorama' 'wget' 'unzip')
makedepends=('python-setuptools')
install="${pkgname}.install"
source=("${_name}-${pkgver}.tar.gz::https://github.com/jotyGill/openpyn-nordvpn/releases/download/${pkgver}/${_name}-2.2.tar.gz")
sha512sums=('2657fb3d3a5a4e649e7a84d5ed4c842a70847764948cbf99dc81fc2130eec16d87c3148949714226d78bafe3b4749a0cf75eb10518c1009b60d0149f53785d57')

build() {
  cd "${srcdir}"/${_name}-2.2
  python setup.py build
}

package() {
  cd "${srcdir}"/${_name}-2.2
  python setup.py install --skip-build -O1 --root="${pkgdir}"
}
