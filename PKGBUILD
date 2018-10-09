# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python2-rosinstall_generator'
pkgname=('python2-rosinstall_generator')
_module='rosinstall_generator'
pkgver='0.1.14'
pkgrel=1
pkgdesc="A tool for generating rosinstall files"
url="http://wiki.ros.org/rosinstall_generator"
depends=('python2' 'python2-argparse' 'python2-catkin_pkg' 'python2-rosdistro' 'python2-rospkg' 'python2-yaml')
provides=('python2-rosinstall-generator')
conflicts=('python-rosinstall_generator' 'python2-rosinstall-generator')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/rosinstall_generator/rosinstall_generator-${pkgver}.tar.gz")
md5sums=('60a7031eb90d08f7ad094728599f1c78')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
