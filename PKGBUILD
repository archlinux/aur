# Maintainer: desbma
pkgname=python-hddfancontrol
pkgver=1.2.4
pkgrel=1
pkgdesc="Regulate fan speed according to hard drive temperature"
arch=('any')
_gitname='hddfancontrol'
url="https://github.com/desbma/${_gitname}"
license=('GPL')
depends=('python' 'hdparm' 'hddtemp')
makedepends=('python-pip')
source=("${_gitname}-${pkgver}.tar.gz:https://github.com/desbma/${_gitname}/archive/${pkgver}.tar.gz")
md5sums=('6a4fe8fb50d3d7d4ec05c329a82e5378')

check() {
    cd "${_gitname}-${pkgver}"
    python setup.py test
}

package() {
    cd "${_gitname}-${pkgver}"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps -r requirements.txt
    python setup.py install --root="${pkgdir}"
}
