# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python2-rospkg'
pkgname=('python2-rospkg')
_module='rospkg'
pkgver='1.1.10'
pkgrel=1
pkgdesc="ROS package library"
url="http://wiki.ros.org/rospkg"
depends=('python2' 'python2-yaml')
conflicts=('python-rospkg')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/15/4e/ab22127ba3564220d1008e03fe06865b51354761276b3dfe2fb9b219cd1d/rospkg-1.1.10.tar.gz")
sha256sums=('f39f8b553a8524b1bf796a66c14b0466d2e7ac3ab8e933c1b3493e0bb8ca2cde')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
