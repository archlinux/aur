# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python2-rospkg'
pkgname=('python2-rospkg')
_module='rospkg'
pkgver='1.2.6'
pkgrel=1
pkgdesc="ROS package library"
url="http://wiki.ros.org/rospkg"
depends=('python2' 'python2-catkin_pkg' 'python2-yaml')
conflicts=('python-rospkg')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('3a27f5037afeba796449b30ad77cb1085fc65f8be10e75e40dbcc3777f83c1a6')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
