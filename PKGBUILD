# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase=('python-rospkg')
pkgname=('python-rospkg')
_module='rospkg'
pkgver='1.1.1'
pkgrel=2
pkgdesc="ROS package library"
url="http://wiki.ros.org/rospkg"
depends=('python' 'python-yaml')
conflicts=('python2-rospkg')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/rospkg/rospkg-${pkgver}.tar.gz")
md5sums=('ae63e738cc85298ebee8e0b1b78e9b56')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
