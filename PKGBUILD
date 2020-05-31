# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python-rosinstall')
pkgver='0.7.8'
pkgrel=5
pkgdesc='Command-line tools for maintaining a workspace of projects from multiple version-control systems, tailored for the ROS community'
arch=('any')
url='https://github.com/vcstools/rosinstall'
license=('BSD')
depends=('python' 'python-catkin_pkg' 'python-rosdistro' 'python-vcstools' 'python-wstool' 'python-yaml')
makedepends=('python-setuptools')

conflicts=('python2-rosinstall')
source=("https://github.com/vcstools/rosinstall/archive/${pkgver}.tar.gz")
sha256sums=('ce1266e63aaefccabb4b0aefc56f8cceb45d4e188a4ecad2f623cbb4a5b1843f')

_module='rosinstall'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
