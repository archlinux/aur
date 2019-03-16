# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python2-rosinstall_generator'
pkgname=('python2-rosinstall_generator')
_module='rosinstall_generator'
pkgver='0.1.15'
pkgrel=1
pkgdesc="A tool for generating rosinstall files"
url="http://wiki.ros.org/rosinstall_generator"
depends=('python2' 'python2-argparse' 'python2-catkin_pkg' 'python2-rosdistro' 'python2-rospkg' 'python2-yaml')
provides=('python2-rosinstall-generator')
conflicts=('python-rosinstall_generator' 'python2-rosinstall-generator')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/4d/e2/917f2e6eebd0f30a2ab8a54e979d1743feeb421b9f8207c6005e3ae839eb/rosinstall_generator-0.1.15.tar.gz")
md5sums=('f5d3d1cba733b3ae51d39388d0483b71')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
