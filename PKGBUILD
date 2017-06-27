# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase=('python2-rosinstall')
pkgname=('python2-rosinstall')
_module='rosinstall'
pkgver='0.7.8'
pkgrel=3
pkgdesc="The installer for ROS"
url="http://wiki.ros.org/rosinstall"
depends=('python2' 'python2-catkin_pkg' 'python2-rosdistro' 'python2-vcstools' 'python2-wstool' 'python2-yaml')
conflicts=('python-rosinstall')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/rosinstall/rosinstall-${pkgver}.tar.gz")
md5sums=('b52ea80b199efdb94e35229eb427965f')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
