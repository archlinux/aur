# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=datalad-next
pkgname=python-$_pkgname
pkgver=1.4.1
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
sha256sums=('3ef558b372fa7676dbbe05900ff137fc7a338b939f4c33ced50df38f6acca56d')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
