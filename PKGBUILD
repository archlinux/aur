# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-rosinstall_generator'
pkgname=('python-rosinstall_generator')
_module='rosinstall_generator'
pkgver='0.1.16'
pkgrel=1
pkgdesc="A tool for generating rosinstall files"
url="http://wiki.ros.org/rosinstall_generator"
depends=('python' 'python-argparse' 'python-catkin_pkg' 'python-rosdistro' 'python-rospkg' 'python-yaml')
provides=('python-rosinstall-generator')
conflicts=('python2-rosinstall_generator' 'python-rosinstall-generator')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/2e/13/abc5f6f36d3bbd86193a8518435d2552dfe9f35720dd56e3b2d7ef707e88/rosinstall_generator-0.1.16.tar.gz")
md5sums=('83e2cd4e67f3f06c636ea0a869407bf7')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
