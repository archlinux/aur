# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-rospkg'
pkgname=('python-rospkg')
_module='rospkg'
pkgver='1.2.6'
pkgrel=1
pkgdesc="ROS package library"
url="http://wiki.ros.org/rospkg"
depends=('python' 'python-catkin_pkg' 'python-distro' 'python-yaml')
conflicts=('python2-rospkg')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('3a27f5037afeba796449b30ad77cb1085fc65f8be10e75e40dbcc3777f83c1a6')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
