# Maintainer: Ekin Dursun <ekindursun@gmail.com>
# Contributor: Oliver Mangold omangold at gmail dot com

_name='xdis'
pkgname="python-${_name}"
pkgver=4.4.0
pkgrel=1
pkgdesc="Python cross-version byte-code disassembler and marshal routines."
arch=('any')
url="https://github.com/rocky/python-xdis/"
license=('MIT')
depends=('python-click' 'python-six>=1.10.0')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('ee12eb0e6f7dfc1aed1a5fc1f0e1aafc47aec76edef320f2f9626b6270396b3a')

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    sed -i '1i#!/usr/bin/python' "$pkgdir/usr/bin/pydisasm"
}
