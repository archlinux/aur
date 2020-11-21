# Maintainer: pumpkincheshire <sollyonzou@gmail.com>

_name=anyconfig-cbor2-backend
pkgname=python-$_name
pkgver=0.1.2
pkgrel=1
pkgdesc='A backend module for python-anyconfig to support CBOR files w/ using cbor2'
url='https://github.com/ssato/python-anyconfig-cbor2-backend'
arch=('any')
license=('MIT')
depends=('python-anyconfig' 'python-cbor2')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('f0d72d0d367062f78dfdbef6f07fd6541cc305f41f1220ed59ad289dc7f0476e')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"
}
