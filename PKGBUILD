# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python2-rosinstall'
pkgname=('python2-rosinstall')
_module='rosinstall'
pkgver='0.7.8'
pkgrel=4
pkgdesc="The installer for ROS"
url="http://wiki.ros.org/rosinstall"
depends=('python2' 'python2-catkin_pkg' 'python2-rosdistro' 'python2-vcstools' 'python2-wstool' 'python2-yaml')
conflicts=('python-rosinstall')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('2ba808bf8bac2cc3f13af9745184b9714c1426e11d09eb96468611b2ad47ed40')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
