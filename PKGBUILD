# Maintainer: steffen <steffenengel at live dot com>

_pkgname=vimgolf
pkgname="python-${_pkgname}"
pkgbase=python-${_pkgname}
pkgver=0.1.10
pkgrel=1
pkgdesc='This project contains a vimgolf client written in Python.'
arch=('any')
url='https://pypi.org/project/vimgolf/'
makedepends=('python-setuptools')
license=('MIT')
source=("${_pkgname}-${pkgver}::https://github.com/dstein64/${_pkgname}/archive/v$pkgver.tar.gz")
md5sums=('514342fb418bb4e0a33671b229b9301a')

build() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py build
}

package() {
    depends=('python')
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
