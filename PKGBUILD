# Contributor: Kyle Manna <kyle[at]kylemanna[d0t]com>
# Maintainer: quietvoid <tcChlisop0@gmail.com>

pkgname=python-class-registry
_pkgname=class-registry
pkgver=5.2.2
pkgrel=1
pkgdesc='The intersection of the Registry and Factory patterns'
url='https://github.com/todofixthis/class-registry'
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=()
license=('MIT')
arch=('any')
source=("https://github.com/todofixthis/${_pkgname}/archive/${pkgver}.tar.gz")
b2sums=('26cd4baf25afe60219c8d76e80bad059f63a652d104e56a159540f19c1abf51b4e76bc3db978db150802e430745336b2f606c9f7b53c49f7009cdfd0f265627c')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    install -m644 LICENCE.txt "$pkgdir/usr/share/licenses/$pkgname"
}
