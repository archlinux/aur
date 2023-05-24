# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
# Contributor: Giacomo Longo <gabibbo97@gmail.com>
pkgname=python-string-utils
pkgver=1.0.0
pkgrel=1
pkgdesc="Utility functions for strings validation and manipulation"
url="https://pypi.org/project/python-string-utils/"
license=('APACHE')
arch=('any')
makedepends=(python-build python-installer python-wheel python-setuptools)
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('dcf9060b03f07647c0a603408dc8b03f807f3b54a05c6e19eb14460256fac0cb')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm "$pkgdir"/usr/README/README.md
    rmdir "$pkgdir"/usr/README
}
