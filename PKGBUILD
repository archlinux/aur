# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python2-catkin_tools'
pkgname=('python2-catkin_tools')
_module='catkin_tools'
pkgver='0.4.5'
pkgrel=2
pkgdesc="Command line tools for working with catkin."
url="http://catkin-tools.readthedocs.org/"
depends=('python2' 'python2-catkin_pkg' 'python2-osrf_pycommon' 'python2-trollius' 'python2-yaml')
provides=('python2-catkin-tools')
conflicts=('python-catkin_tools' 'python2-catkin-tools')
makedepends=('python2-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('50ebfd047a74e657cb1f3e150976355e23afbda519c4cecf63d7f548477730c3')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
