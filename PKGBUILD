# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-rospkg'
pkgname=('python-rospkg')
_module='rospkg'
pkgver='1.1.10'
pkgrel=2
pkgdesc="ROS package library"
url="http://wiki.ros.org/rospkg"
depends=('python' 'python-yaml')
conflicts=('python2-rospkg')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('f39f8b553a8524b1bf796a66c14b0466d2e7ac3ab8e933c1b3493e0bb8ca2cde')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
