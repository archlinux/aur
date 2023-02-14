# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-class-registry
_pkgname=class-registry
pkgver=4.0.5
pkgrel=1
pkgdesc='The intersection of the Registry and Factory patterns'
url='https://github.com/todofixthis/class-registry'
depends=('python')
makedepends=('python-setuptools')
optdepends=()
license=('MIT')
arch=('any')
source=("https://github.com/todofixthis/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('35664980970d9a03964e5c60103bd3c33703934f97b3a4302314c417bfedc915342af129256b1d569578cef9ae9f426616dd7c81c49925cd8ea0c4b441240460')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python3 setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir" --optimize=1

    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    install -m644 LICENCE.txt "$pkgdir/usr/share/licenses/$pkgname"
}
