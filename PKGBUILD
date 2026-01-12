# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: SZanko szanko at protonmail dot com

pkgname=python-fsutil
pkgver=0.16.0
pkgrel=1
pkgdesc="High-level file-system operations for lazy devs"
arch=('any')
url="https://github.com/fabiocaccamo/python-fsutil"
license=('MIT')
depends=(
	'python'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('89002c2dda97bbab53b7b5154cd757fb7dcfb0bb8e260f295a164f87cb4fc66a')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
