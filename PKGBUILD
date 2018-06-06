# Maintainer: Ekin Dursun <ekindursun@gmail.com>
# Contributor: Oliver Mangold omangold at gmail dot com

_name='xdis'
pkgbase="python-${_name}"
pkgname=("python-${_name}" "python2-${_name}")
pkgver=3.8.2
pkgrel=3
pkgdesc="Python cross-version byte-code disassembler and marshal routines."
arch=('any')
url="https://github.com/rocky/python-xdis/"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-click')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e8548be5a386f51a6a0295e033984869ed71191879adc3d5aed17cd4a030ad8f')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package_python-xdis() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir"
}

package_python2-xdis() {
    cd "$srcdir/$_name-$pkgver"
    python2 setup.py install --root="$pkgdir"
    mv "$pkgdir/usr/bin/pydisasm" "$pkgdir/usr/bin/pydisasm2"
}
