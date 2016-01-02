# Maintainer: Orestis Floros <orestisf1993@gmail.com>

_pkgname=easygui
pkgname=python-easygui-git
pkgver=r172.cbd30b0
pkgrel=1
pkgdesc='A module for very simple, very easy GUI programming in Python'
url='https://github.com/robertlugg/easygui'
license=('CCPL')
source=('git+https://github.com/robertlugg/easygui')
sha256sums=('SKIP')
arch=('any')
depends=('python' 'tk')
makedepends=('git' 'python-setuptools')
conflicts=('python-easygui')
provides=('python-easygui')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    
    # Get the version number.
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root=$pkgdir
}
