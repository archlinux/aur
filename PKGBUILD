# Maintainer: Adhityaa Chandrasekar <c.adhityaa@gmail.com>
pkgname=python-unidiff
pkgver=0.5.3
pkgrel=2
pkgdesc="Simple Python library to parse and interact with unified diff data."
arch=('any')
url="https://github.com/matiasb/python-unidiff"
license=('MIT')
depends=(
            'python'
            'python-setuptools'
        )
makedepends=(
                'python-setuptools'
                'python-pip'
            )
source=("https://pypi.io/packages/source/u/unidiff/unidiff-$pkgver.tar.gz")
sha256sums=('79b4be3e5479dfc6d77747d23ec98200559ca6a842fad1f92c2a7eb56b99195b')

prepare() {
    cd "$srcdir/unidiff-$pkgver"
}

build() {
	cd "$srcdir/unidiff-$pkgver"
    python3 setup.py build
}

check() {
	cd "$srcdir/unidiff-$pkgver"
}

package() {
	cd "$srcdir/unidiff-$pkgver"
    python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
