# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-rosinstall'
pkgname=('python-rosinstall')
_module='rosinstall'
pkgver='0.7.8'
pkgrel=4
pkgdesc="The installer for ROS"
url="http://wiki.ros.org/rosinstall"
depends=('python' 'python-catkin_pkg' 'python-rosdistro' 'python-vcstools' 'python-wstool' 'python-yaml')
conflicts=('python2-rosinstall')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('2ba808bf8bac2cc3f13af9745184b9714c1426e11d09eb96468611b2ad47ed40')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
