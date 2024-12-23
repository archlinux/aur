# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=font-line
pkgver=3.1.4
pkgrel=5
pkgdesc='OpenType vertical metrics reporting and font line spacing adjustment tool'
arch=(any)
url="https://github.com/source-foundry/$pkgname"
license=(MIT)
depends=(python
         python-commandlines
         python-fonttools
         python-standardstreams)
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('033baa102ab9c61a653f213997610e0de308d5bc75e989923927a0519687cbb1')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
