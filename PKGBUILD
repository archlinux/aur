# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-rosinstall_generator'
pkgname=('python-rosinstall_generator')
_module='rosinstall_generator'
pkgver='0.1.15'
pkgrel=1
pkgdesc="A tool for generating rosinstall files"
url="http://wiki.ros.org/rosinstall_generator"
depends=('python' 'python-argparse' 'python-catkin_pkg' 'python-rosdistro' 'python-rospkg' 'python-yaml')
provides=('python-rosinstall-generator')
conflicts=('python2-rosinstall_generator' 'python-rosinstall-generator')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/4d/e2/917f2e6eebd0f30a2ab8a54e979d1743feeb421b9f8207c6005e3ae839eb/rosinstall_generator-0.1.15.tar.gz")
md5sums=('f5d3d1cba733b3ae51d39388d0483b71')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
