# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase=('python-rospkg')
pkgname=('python-rospkg')
_module='rospkg'
pkgver='1.1.3'
pkgrel=1
pkgdesc="ROS package library"
url="http://wiki.ros.org/rospkg"
depends=('python' 'python-yaml')
conflicts=('python2-rospkg')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/rospkg/rospkg-${pkgver}.tar.gz")
md5sums=('11468dd5007ca89ebdce70d2766fd836')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
