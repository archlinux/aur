# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python2-catkin_tools'
pkgname=('python2-catkin_tools')
_module='catkin_tools'
pkgver='0.4.5'
pkgrel=1
pkgdesc="Command line tools for working with catkin."
url="http://catkin-tools.readthedocs.org/"
depends=('python2' 'python2-catkin_pkg' 'python2-osrf_pycommon' 'python2-trollius' 'python2-yaml')
provides=('python2-catkin-tools')
conflicts=('python-catkin_tools' 'python2-catkin-tools')
makedepends=('python2-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/1c/9a/d5c2cd6178dd6a66744a28e185a9a124b4284a49759b5427024f27d6afe1/catkin_tools-0.4.5.tar.gz")
md5sums=('0212ce968d1128dba7d4a615ea170546')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
