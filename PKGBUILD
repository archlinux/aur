# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-rospkg'
pkgname=('python-rospkg')
_module='rospkg'
pkgver='1.2.4'
pkgrel=2
pkgdesc="ROS package library"
url="http://wiki.ros.org/rospkg"
depends=('python' 'python-catkin_pkg' 'python-distro' 'python-yaml')
conflicts=('python2-rospkg')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('2ece38f11e3fcf5e2ce12b677e9967c4082ad2a00651d4c5c1bfaf73ab297997')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
