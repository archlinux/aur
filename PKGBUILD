# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-sfdutf7
_pkgname=${pkgname#python-}
pkgver=0.1.0
pkgrel=1
pkgdesc='SFDUTF7 encoder/decoder library '
arch=(any)
url="https://github.com/ctrlcctrlv/$_pkgname.py"
license=(Apache)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_archive.tar.gz")
sha256sums=('2f1e61c431de0e04d211280d3b07374f415c778cc1b0b7752e71d0e03ea12f20')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
