# Maintainer: steffen

_pkgname=vimgolf
pkgname="python-${_pkgname}"
pkgbase=python-vimgolf
pkgver=0.5.1
pkgrel=1
pkgdesc='This project contains a vimgolf client written in Python.'
arch=('any')
url='https://pypi.org/project/vimgolf/'
makedepends=('python-setuptools')
license=('MIT')
source=("${_pkgname}-${pkgver}::https://github.com/dstein64/${_pkgname}/archive/v$pkgver.tar.gz")
md5sums=('ce848efa0a705c9b284bbf94172290fb')

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
