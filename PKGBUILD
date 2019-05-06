# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python2-rosdistro'
pkgname=('python2-rosdistro')
_module='rosdistro'
pkgver='0.7.4'
pkgrel=1
pkgdesc="A tool to work with rosdistro files"
url="http://wiki.ros.org/rosdistro"
depends=('python2' 'python2-catkin_pkg' 'python2-rospkg' 'python2-yaml')
conflicts=('python-rosdistro')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/e9/0c/1e6127d900b6f828db37df36ef971f249f2429924acdac36a79d5e31ae60/rosdistro-0.7.4.tar.gz")
sha256sums=('266e1a27d939a6a3c1f3e4dc3043f4b8306601b5ca1cb96ef8e5904ac2d397ef')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
