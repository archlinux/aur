# Maintainer: Ross Chadwick <hello@rchadwick.co.uk>

pkgbase=nordnm
pkgname=nordnm
_module='nordnm'
provides=('nordnm')
pkgver='0.8.0'
pkgrel=1
pkgdesc="A CLI tool for automating the importing, securing and usage of NordVPN OpenVPN servers through NetworkManager."
url="https://github.com/Chadsr/NordVPN-NetworkManager"
depends=('python' 'iputils' 'sudo' 'networkmanager' 'openvpn' 'networkmanager-openvpn' 'python-requests' 'python-numpy' 'systemd')
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/n/nordnm/nordnm-${pkgver}.tar.gz")
md5sums=('fd5750808e9d49f80e600526f1abfbcd')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
