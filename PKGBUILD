# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python-catkin_lint')
pkgver='1.6.17'
pkgrel=1
pkgdesc='Check catkin packages for common errors'
arch=('any')
url='https://github.com/fkie/catkin_lint'
license=('BSD')
depends=('python' 'python-catkin_pkg' 'python-lxml')
makedepends=('python-setuptools')
provides=('python-catkin-lint')
conflicts=('python2-catkin_lint' 'python-catkin-lint')
source=("https://github.com/fkie/catkin_lint/archive/${pkgver}.tar.gz")
sha256sums=('8316eec290e150e77bf4160fefe25ccee8ffec81ca7f6e464ea15b9c5aba3d9f')

_module='catkin_lint'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
