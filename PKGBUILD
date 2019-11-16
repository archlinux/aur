# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python2-rosdistro'
pkgname=('python2-rosdistro')
_module='rosdistro'
pkgver='0.7.5'
pkgrel=2
pkgdesc="A tool to work with rosdistro files"
url="http://wiki.ros.org/rosdistro"
depends=('python2' 'python2-catkin_pkg' 'python2-rospkg' 'python2-yaml')
conflicts=('python-rosdistro')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('85908df55c6a930ec41b8ac2d1574c578c4049d8337f4b1843113bec001e6fe6')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
