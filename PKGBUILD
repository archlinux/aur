# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase=('python-rosinstall')
pkgname=('python-rosinstall')
_module='rosinstall'
pkgver='0.7.8'
pkgrel=3
pkgdesc="The installer for ROS"
url="http://wiki.ros.org/rosinstall"
depends=('python' 'python-catkin_pkg' 'python-rosdistro' 'python-vcstools' 'python-wstool' 'python-yaml')
conflicts=('python2-rosinstall')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/rosinstall/rosinstall-${pkgver}.tar.gz")
md5sums=('b52ea80b199efdb94e35229eb427965f')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
