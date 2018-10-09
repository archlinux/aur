# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-rosinstall_generator'
pkgname=('python-rosinstall_generator')
_module='rosinstall_generator'
pkgver='0.1.14'
pkgrel=1
pkgdesc="A tool for generating rosinstall files"
url="http://wiki.ros.org/rosinstall_generator"
depends=('python' 'python-argparse' 'python-catkin_pkg' 'python-rosdistro' 'python-rospkg' 'python-yaml')
provides=('python-rosinstall-generator')
conflicts=('python2-rosinstall_generator' 'python-rosinstall-generator')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/rosinstall_generator/rosinstall_generator-${pkgver}.tar.gz")
md5sums=('60a7031eb90d08f7ad094728599f1c78')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
