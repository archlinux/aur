# Maintainer: Allen Wild <allenwild93@gmail.com>
_name=dircolors
pkgname=python-${_name}
pkgver=0.0.2
pkgrel=1
pkgdesc='Python library to colorize and format file names based on type'
arch=('any')
url='https://github.com/aswild/pydircolors'
license=('Apache')
depends=('python' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('fe277273ac25bb662c9d91bfc3382aa2be97a9ead38fa4e8024f68743c189685')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
