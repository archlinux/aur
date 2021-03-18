# Maintainer: Paul Irofti <paul@irofti.net>

_name="tamu_d3m"
pkgname="python-$_name-git"
pkgver=r8.423bbb8
pkgrel=2

pkgdesc="core package for D3M project"
url="https://github.com/tods-doc/tamu_d3m"
arch=('any')
license=('Apache')

depends=('python'
    'python-scikit-learn'
    'python-pytypes'
    'python-frozendict'
    'python-numpy'
    'python-jsonschema'
    'python-requests'
    'python-strict-rfc3339'
    'python-rfc3987'
    'python-webcolors'
    'python-dateparser'
    'python-dateutil'
    'python-pandas'
    'python-typing_inspect'
    'python-gitpython'
    'python-jsonpath-ng'
    'python-custom_inherit'
    'python-yaml'
    'python-pyarrow'
    'python-gputil'
    'python-pyrsistent'
    'python-scipy'
    'python-openml')
makedepends=('git' 'python-setuptools')
provides=("python-$_name")
conflicts=("python-$_name" "python-d3m")

source=("git+https://github.com/tods-doc/$_name.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_name"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_name"
    python setup.py build
}

package() {
  cd "$srcdir/$_name"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:ts=2:sw=2:et:
