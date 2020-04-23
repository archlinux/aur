# Maintainer: Ekin Dursun <ekindursun@gmail.com>
# Contributor: Oliver Mangold omangold at gmail dot com

_name='xdis'
pkgname="python-${_name}"
pkgver=4.3.2
pkgrel=1
pkgdesc="Python cross-version byte-code disassembler and marshal routines."
arch=('any')
url="https://github.com/rocky/python-xdis/"
license=('MIT')
depends=('python-click' 'python-six>=1.10.0')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('0efc601c13a3cd9e70aba369a7380da051427c5a1d502fd42e90d9e397cf20d9')

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    sed -i '1i#!/usr/bin/python' "$pkgdir/usr/bin/pydisasm"
}
