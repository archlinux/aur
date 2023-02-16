# Maintainer: Philipp A. <flying-sheep@web.de>
# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
_name=asciitree
pkgname=python-asciitree
pkgver=0.3.3
pkgrel=1
pkgdesc='Draws +-- ASCII Trees'
arch=('any')
url='http://github.com/mbr/asciitree'
license=('MIT')
depends=('python')
depends=('python-build' 'python-installer' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4aa4b9b649f85e3fcb343363d97564aa1fb62e249677f2e18a96765145cc0f6e')

build() {
	cd "$_name-$pkgver"
    python -m build -n -w
}

package() {
	cd "$_name-$pkgver"
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        dist/${_name}-${pkgver}-*.whl
}
