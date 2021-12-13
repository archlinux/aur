# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=font-line
pkgver=3.1.4
pkgrel=2
pkgdesc='OpenType vertical metrics reporting and font line spacing adjustment tool'
arch=(any)
url="https://github.com/source-foundry/$pkgname"
license=(MIT)
depends=(python
         python-commandlines
         python-fonttools
         python-standardstreams)
makedepends=(python-setuptools-scm)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('033baa102ab9c61a653f213997610e0de308d5bc75e989923927a0519687cbb1')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
