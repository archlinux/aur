# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-rosdistro'
pkgname=('python-rosdistro')
_module='rosdistro'
pkgver='0.8.0'
pkgrel=1
pkgdesc="A tool to work with rosdistro files"
url="http://wiki.ros.org/rosdistro"
depends=('python' 'python-catkin_pkg' 'python-rospkg' 'python-yaml')
conflicts=('python2-rosdistro')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('61cd06de5fbde94664734c0521c4536f893e2666e684c949e2a1c4ba24e605b9')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
