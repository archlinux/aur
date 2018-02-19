# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase=('python-rosdistro')
pkgname=('python-rosdistro')
_module='rosdistro'
pkgver='0.6.6'
pkgrel=1
pkgdesc="A tool to work with rosdistro files"
url="http://wiki.ros.org/rosdistro"
depends=('python' 'python-catkin_pkg' 'python-rospkg' 'python-yaml')
conflicts=('python2-rosdistro')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/rosdistro/rosdistro-${pkgver}.tar.gz")
md5sums=('ba11fdd53d8f3122b976633849ebcab5')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
