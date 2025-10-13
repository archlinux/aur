# Contributor: Devaev Maxim <mdevaev@gmail.com>
# Author: Devaev Maxim <mdevaev@gmail.com>


pkgname=emonoda
pkgver=2.1.40
pkgrel=3
pkgdesc="A set of tools to organize and manage your torrents"
url="https://github.com/mdevaev/emonoda"
license=(GPL)
arch=(any)
depends=(
	"python>=3.13"
	"python<3.14"
	python-chardet
	python-yaml
	python-colorama
	python-pygments
	python-mako
	python-pytz
	python-dateutil
)
optdepends=(
	"python-transmissionrpc: Transmission support"
	"python-dbus: KTorrent support"
)
makedepends=(python-setuptools cython)
source=("$pkgname-$pkgver::git+$url#tag=v$pkgver")
md5sums=(SKIP)


build() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir"
}
