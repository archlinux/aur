# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-rospkg'
pkgname=('python-rospkg')
_module='rospkg'
pkgver='1.1.8'
pkgrel=1
pkgdesc="ROS package library"
url="http://wiki.ros.org/rospkg"
depends=('python' 'python-yaml')
conflicts=('python2-rospkg')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/70/dd/fe2e3ad6c94a30bad0ba27f19f229a1bf0d25a779e37ad40b6fd54d0f62f/rospkg-1.1.8.tar.gz")
sha256sums=('7888d6e3afe2d1a0347340cc628496fffbe6baccc82cb4b238382bbbb5e880a1')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
