# Maintainer: Ross Chadwick <hello@rchadwick.co.uk>

pkgbase=('nordnm')
pkgname=('nordnm')
_module='nordnm'
pkgver='0.0a14'
pkgrel=1
pkgdesc="A Python 3 CLI tool for automating the management of NordVPN OpenVPN servers through NetworkManager."
url="https://github.com/Chadsr/NordVPN-NetworkManager"
depends=('python' 'iputils' 'sudo' 'networkmanager' 'openvpn' 'networkmanager-openvpn')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/n/nordnm/nordnm-${pkgver}.tar.gz")
md5sums=('512eaa5db4de2e22ea071ced58e91c7b')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
