# Maintainer: Gustavo Jasso <gustavo at jasso dot info>
pkgname='python-asyncio-contextmanager'
_name=${pkgname#python-}
pkgdesc="Decorator that turns async generator functions into async context managers."
pkgver=1.0.1
pkgrel=1
url="https://github.com/sashgorokhov/asyncio-contextmanager"
arch=('any')
license=('MIT')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('c8ce0047d83dfcb6654debd8a434d7b7')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    install -Dm644 "$startdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
