# Maintainer: Michael Riegert <michael at eowyn net>

pkgname=python-pycdlib-git
_name=pycdlib
pkgver=1.15.0.0.g67fe5ea
pkgrel=1
pkgdesc='Python library to read and write ISOs'
arch=('any')
url=https://github.com/clalancette/pycdlib
license=('LGPL2.1')
depends=('python')
makedepends=('python-setuptools' 'git')
source=("$_name::git+${url}.git")
sha512sums=('SKIP')
provides=('python-pycdlib')
conflicts=('python-pycdlib')

pkgver() {
    cd "$_name"
    git describe --long --tags | sed 's/v//g;s/-/./g'
}

build() {
    cd "$_name"
    python setup.py build
}

package() {
    cd "$_name"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
