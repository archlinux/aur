# Maintainer: Pierre Ayoub <pierre.ayoub@protonmail.com>

pkgname=papis-dmenu
pkgver=0.3
pkgrel=1
pkgdesc="Papis plugin implementing a picker based on dmenu"
arch=('any')
url="https://github.com/papis/${pkgname}"
license=()
depends=('python' 'papis' 'dmenu' 'python-dmenu')
makedepends=(python-build python-installer python-wheel)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1cea0bec021e41b11236ca2321172ae4c5854a6ba04158abace28ce0314ddb44')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.rst "$pkgdir/usr/share/doc/${pkgname}/README.rst"
}

# vim: set et sw=4 ts=4 :
