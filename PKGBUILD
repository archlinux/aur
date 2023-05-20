# Maintainer: Stefan Gehr <stefangehr@protonmail.com>

_name=sysrsync
pkgname=python-sysrsync
pkgver=1.1.1
pkgrel=1
pkgdesc='Simple and safe native rsync wrapper for Python 3'
arch=(any)
url="https://github.com/gchamon/sysrsync"
license=(MIT)
depends=(python rsync python-tomli python-toml)
makedepends=(python-setuptools)
source=($pkgname-$pkgver.tar.gz::"https://github.com/gchamon/sysrsync/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('7a48ce8058c53e36fc1072b113a3990dc6026526dc6c7164403b207fba32d6f885d02e394c73aefa7b664a7809739d5e176be48e31174cdb18bcdfd921083dcf')

build() {
	cd $_name-$pkgver
	python setup.py build
}

package(){
	cd $_name-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
	install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
