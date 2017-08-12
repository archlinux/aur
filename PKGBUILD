# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase=('python2-rospkg')
pkgname=('python2-rospkg')
_module='rospkg'
pkgver='1.1.2'
pkgrel=1
pkgdesc="ROS package library"
url="http://wiki.ros.org/rospkg"
depends=('python2' 'python2-yaml')
conflicts=('python-rospkg')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/rospkg/rospkg-${pkgver}.tar.gz")
md5sums=('e14bc946c8309d6e5b70a730dc056f8e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
