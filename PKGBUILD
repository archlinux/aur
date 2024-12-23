# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=markdown2ctags
pkgver=0.3.3
pkgrel=5
pkgdesc='Generate ctags-compatible tags files for Markdown documents'
arch=(any)
license=(BSD-3-Clause)
url="https://github.com/jszakmeister/$pkgname"
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e633f6d9baebdfc97349707825543958aead128b6385def2a0f011ee32b0c29d')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.rst
}
