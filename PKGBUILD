# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >

pkgname=python-useful-types
pkgver=0.2.1
pkgrel=1
pkgdesc="Useful types for Python."
arch=('any')
url="https://github.com/hauntsaninja/useful_types"
license=('MIT')
depends=(
	'python'
	'python-typing_extensions'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-flit-core'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=(
	'eda401a958cfdb041dd4642f002a1cdff321a7e0c6c6ca7b33a7e879235e8370'
)

build() {
	cd "${srcdir}/useful_types-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/useful_types-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
