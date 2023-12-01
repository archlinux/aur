# Contributor: Devaev Maxim <mdevaev@gmail.com>
# Author: Devaev Maxim <mdevaev@gmail.com>


pkgname=emonoda
pkgver=2.1.37
pkgrel=1
pkgdesc="A set of tools to organize and manage your torrents"
url="https://github.com/mdevaev/emonoda"
license=(GPL)
arch=(any)
depends=(
	"python>=3.10"
	"python<3.11"
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
