# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python2-rospkg'
pkgname=('python2-rospkg')
_module='rospkg'
pkgver='1.1.7'
pkgrel=1
pkgdesc="ROS package library"
url="http://wiki.ros.org/rospkg"
depends=('python2' 'python2-yaml')
conflicts=('python-rospkg')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/rospkg/rospkg-${pkgver}.tar.gz")
md5sums=('a5b9c6d6b8e101ff2d29e2335afdadab')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
