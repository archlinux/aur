# Maintainer: pumpkincheshire <sollyonzou@gmail.com>

_name=anyconfig-msgpack-backend
pkgname=python-$_name
pkgver=0.1.1
pkgrel=1
pkgdesc='a backend module for python-anyconfig to support to load and dump MessagePack data files.'
url='https://github.com/ssato/python-anyconfig-msgpack-backend'
arch=('any')
license=('MIT')
depends=('python-anyconfig' 'python-msgpack')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('223c3619dbb4eb433360494b0560f3694e5fa0dd69032db65e8c5318597bb348')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"
}
