# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-browserstack-local
_pkgname=browserstack-local
pkgver=1.2.16
pkgrel=1
pkgdesc='Python bindings for BrowserStack Local'
arch=(any)
url="http://github.com/browserstack/$_pkgname-python"
license=(MIT)
depends=(python
         python-psutil)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="${_pkgname/-/_}-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_archive.tar.gz")
sha256sums=('35742386288ac30b46dae497abaea75f9e76015dd5dbbb05d6f739c60362fa5e')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
