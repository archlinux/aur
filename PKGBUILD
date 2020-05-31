# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python-rosinstall_generator')
pkgver='0.1.19'
pkgrel=2
pkgdesc='A tool for generating rosinstall files'
arch=('any')
url='https://github.com/ros-infrastructure/rosinstall_generator'
license=('BSD')
depends=('python' 'python-argparse' 'python-catkin_pkg' 'python-rosdistro' 'python-rospkg' 'python-yaml')
makedepends=('python-setuptools')
provides=('python-rosinstall-generator')
conflicts=('python2-rosinstall_generator' 'python-rosinstall-generator')
source=("https://github.com/ros-infrastructure/rosinstall_generator/archive/${pkgver}.tar.gz")
sha256sums=('97f23bd869feea8a2f92749e275f5776829484bd5040fd8ca3b148cc0e9551e0')

_module='rosinstall_generator'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
