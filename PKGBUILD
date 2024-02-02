# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=datalad-next
pkgname=python-$_pkgname
pkgver=1.2.0
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
sha256sums=('5d3b22ac31a9f6403b5a73cfb4048b6df6a6120b0edb4935a76fac0c45bb32fa')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
