# Maintainer: pumpkincheshire <sollyonzou@gmail.com>

_name=anyconfig-cbor-backend
pkgname=python-$_name
pkgver=0.1.2
pkgrel=1
pkgdesc='This is a backend module for python-anyconfig to support to load and dump CBOR files with using cbor.'
url='https://github.com/ssato/python-anyconfig-cbor-backend'
arch=('any')
license=('MIT')
depends=('python-anyconfig' 'python-cbor')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('095a01db7057b808cd29c5b63a6a808aedc5d97b7fd58c1ddb310e1b8c9a1a05')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"
}
