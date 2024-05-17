# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=datalad-next
pkgname=python-$_pkgname
pkgver=1.4.0
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
sha256sums=('8dd5ca55c420212c3ec437572e6e6c2f4f7a95d024b3f7a6a775d7e5d9c872d4')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
