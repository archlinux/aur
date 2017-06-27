# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase=('python-rosinstall_generator')
pkgname=('python-rosinstall_generator')
_module='rosinstall_generator'
pkgver='0.1.13'
pkgrel=2
pkgdesc="A tool to generator rosinstall files"
url="http://wiki.ros.org/rosinstall_generator"
depends=('python' 'python-argparse' 'python-catkin_pkg' 'python-rosdistro' 'python-rospkg' 'python-yaml')
provides=('python-rosinstall-generator')
conflicts=('python2-rosinstall_generator' 'python-rosinstall-generator')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/rosinstall_generator/rosinstall_generator-${pkgver}.tar.gz")
md5sums=('605826dbfea6a0e802d3b96d6f848548')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
