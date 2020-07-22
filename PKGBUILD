# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-class-registry
_pkgname=class-registry
pkgver=3.0.5
pkgrel=1
pkgdesc='The intersection of the Registry and Factory patterns'
url='https://github.com/todofixthis/class-registry'
depends=('python')
optdepends=()
license=('MIT')
arch=('any')
source=("https://github.com/todofixthis/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('324171cbf14132e02c58026d90c87d408fd321d95258cf8cd66de472a125177c4131ca1e47fad279db3384a8a3a50832eb1287a4b577c76c79a9391fa1d998c6')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python3 setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir" --optimize=1
}

