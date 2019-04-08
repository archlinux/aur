# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python2-rosinstall_generator'
pkgname=('python2-rosinstall_generator')
_module='rosinstall_generator'
pkgver='0.1.16'
pkgrel=1
pkgdesc="A tool for generating rosinstall files"
url="http://wiki.ros.org/rosinstall_generator"
depends=('python2' 'python2-argparse' 'python2-catkin_pkg' 'python2-rosdistro' 'python2-rospkg' 'python2-yaml')
provides=('python2-rosinstall-generator')
conflicts=('python-rosinstall_generator' 'python2-rosinstall-generator')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/2e/13/abc5f6f36d3bbd86193a8518435d2552dfe9f35720dd56e3b2d7ef707e88/rosinstall_generator-0.1.16.tar.gz")
md5sums=('83e2cd4e67f3f06c636ea0a869407bf7')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
