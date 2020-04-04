# Maintainer: Ekin Dursun <ekindursun@gmail.com>
# Contributor: Oliver Mangold omangold at gmail dot com

_name='xdis'
pkgname="python-${_name}"
pkgver=4.2.4
pkgrel=1
pkgdesc="Python cross-version byte-code disassembler and marshal routines."
arch=('any')
url="https://github.com/rocky/python-xdis/"
license=('MIT')
depends=('python-click' 'python-six>=1.10.0')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('f1a615442b46075152fe3d5f8c5c0ddb1496a5a02405d9618dfe17506a3001eb')

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    sed -i '1i#!/usr/bin/python' "$pkgdir/usr/bin/pydisasm"
}
