# Maintainer: desbma
pkgname=python-hddfancontrol
pkgver=1.2.5
pkgrel=3
pkgdesc="Regulate fan speed according to hard drive temperature"
arch=('any')
_gitname='hddfancontrol'
url="https://github.com/desbma/${_gitname}"
license=('GPL')
depends=('python' 'python-daemon' 'hdparm' 'hddtemp')
makedepends=('python-pip')
source=("${_gitname}-${pkgver}.tar.gz::https://github.com/desbma/${_gitname}/archive/${pkgver}.tar.gz")
md5sums=('e71ad947ca278b703fb39328d31974d9')

check() {
    cd "${_gitname}-${pkgver}"
    python setup.py test
}

package() {
    cd "${_gitname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
