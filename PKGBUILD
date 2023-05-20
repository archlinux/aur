# Maintainer: Stefan Gehr <stefangehr@protonmail.com>

_name=sysrsync
pkgname=python-sysrsync
pkgver=1.1.0
pkgrel=1
pkgdesc='Simple and safe native rsync wrapper for Python 3'
arch=(any)
url="https://github.com/gchamon/sysrsync"
license=(MIT)
depends=(python rsync python-tomli python-toml)
makedepends=(python-setuptools)
source=($pkgname-$pkgver.tar.gz::"https://github.com/gchamon/sysrsync/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('aed423238f42109bc32f91e9fae330215fe6564b5e673789c4c61941c2778568ea9ab50dd74ba89583532a02f09cd1ea1c0018c2ba81a20b29eef3b3aa4f4339')

build() {
	cd $_name-$pkgver
	python setup.py build
}

package(){
	cd $_name-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
	install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
