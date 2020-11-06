# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python-rosdistro')
pkgver='0.8.3'
pkgrel=1
pkgdesc='A tool to work with rosdistro files'
arch=('any')
url='https://github.com/ros-infrastructure/rosdistro'
license=('BSD')
depends=('python' 'python-catkin_pkg' 'python-rospkg' 'python-yaml')
makedepends=('python-setuptools')

conflicts=('python2-rosdistro')
source=("https://github.com/ros-infrastructure/rosdistro/archive/${pkgver}.tar.gz")
sha256sums=('ecdf3fc85a1aced74950d8bf8946509d841aa846277789c037ac38e11ed67e2e')

_module='rosdistro'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
