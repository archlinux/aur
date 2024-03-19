# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=datalad-next
pkgname=python-$_pkgname
pkgver=1.3.0
pkgrel=1
pkgdesc='extension for new and improved functionality and user experience in datalad'
arch=(any)
url="https://github.com/datalad/$_pkgname"
license=(MIT)
depends=(python
         python-datalad)
makedepends=(python-{build,installer,wheel})
_archive="$_pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('aab2fe45aba72e1eac6980292526b2c75d238cde7d96d61ba20e83b06fb393a8')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
