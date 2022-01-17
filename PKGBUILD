_pkgname=pyg600
pkgname=$_pkgname-git
pkgrel=1
pkgver=1.2.0.r1.g6105f6d
pkgdesc="Utility program for binding actions to keys on the Logitech G600 gaming mouse"
url="https://github.com/j-waters/pyg600"
depends=('python-click'
         'pymacropad')
makedepends=('git' 'python-setuptools')
conflicts=('pyg600')
provides=('pyg600')
license=('GPL')
arch=('any')
source=("${_pkgname}::git+${url}.git")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

