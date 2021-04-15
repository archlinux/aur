# Maintainer: Max <max@swk-web.com>

_pkgname=csv-diff
pkgname=python-${_pkgname}
pkgver=1.1
pkgrel=1
pkgdesc='Tool for viewing the difference between two CSV, TSV or JSON files.'
arch=('any')
url=''https://pypi.org/project/csv-diff/
license=('Apache')
depends=('python')
makedepends=('python-setuptools' 'python-pip' 'python-dictdiffer' 'python-click')
source=("$pkgname-$pkgver.tar.gz::https://github.com/simonw/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('588a9b3203564e875030f7ef47b96ccb4ee134d70a09c0175c0881580a00a7bf')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --optimize=1 --prefix=/usr --root="$pkgdir" --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


