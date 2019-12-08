# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-rospkg'
pkgname=('python-rospkg')
_module='rospkg'
pkgver='1.2.0'
pkgrel=1
pkgdesc="ROS package library"
url="http://wiki.ros.org/rospkg"
depends=('python' 'python-yaml')
conflicts=('python2-rospkg')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('7fadfa007e8e1efe1184c6a1dc817d374f9c889732e5dcf154886cc12499bb32')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
