# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-ntfs
_pkgname=${pkgname#python-}
pkgver=0.1.4
pkgrel=2
pkgdesc='Python module to manipulate NTFS junctions and hardlinks'
arch=(any)
url="https://github.com/sunshowers/$_pkgname"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
_archive="$_pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('80ada586fd132b1db9fc6b2a844b98f4e2a883cb26f115f6af2b58f84295da98')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
