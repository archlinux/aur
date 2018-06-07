# Maintainer: Ekin Dursun <ekindursun@gmail.com>
# Contributor: Oliver Mangold omangold at gmail dot com

_name='xdis'
pkgbase="python-${_name}"
pkgname=("python-${_name}" "python2-${_name}")
pkgver=3.8.3
pkgrel=2
pkgdesc="Python cross-version byte-code disassembler and marshal routines."
arch=('any')
url="https://github.com/rocky/python-xdis/"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('edf8188d12fb1f29246b2f9232bcc0e361ed5ad6845f312178e8060e14ffc78d')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package_python-xdis() {
    depends=('python-click')

    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir"
}

package_python2-xdis() {
    depends=('python2-click')

    cd "$srcdir/$_name-$pkgver"
    python2 setup.py install --root="$pkgdir"
    mv "$pkgdir/usr/bin/pydisasm" "$pkgdir/usr/bin/pydisasm2"
}
