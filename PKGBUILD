# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-beziers
_pyname=${pkgname#python-}
pkgver=0.4.0
pkgrel=1
pkgdesc='Routines for extracting information from font glyphs'
arch=(any)
url="https://github.com/simoncozens/$_pyname"
license=(MIT)
depends=(python)
makedepends=(python-{build,installer}
             python-setuptools
             python-wheel)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('3a01994887928971fd88b34777dea42ff49813264d8ffddee909310d03959ef5')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
