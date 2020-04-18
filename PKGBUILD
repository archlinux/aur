# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-rosdistro'
pkgname=('python-rosdistro')
_module='rosdistro'
pkgver='0.8.1'
pkgrel=1
pkgdesc="A tool to work with rosdistro files"
url="http://wiki.ros.org/rosdistro"
depends=('python' 'python-catkin_pkg' 'python-rospkg' 'python-yaml')
conflicts=('python2-rosdistro')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('48e571af56af29c7bbc4a194564c33aaa363bcb028e633fb4e8c0e28dbeac334')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
