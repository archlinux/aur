# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-sfdutf7
_pkgname=${pkgname#python-}
pkgver=0.0.1
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
sha256sums=('0d4a1094d79f63dbf4c11421b3d4fca879ae064a2e544528f111bfe0052cfe28')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
