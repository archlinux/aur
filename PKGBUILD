# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='absolutely-proprietary'
pkgver='20190627'
_commit='4a126c8bfe173d916f0569939ef31d1786bb30d5'
pkgrel='2'
pkgdesc="Proprietary package detector for arch-based distros that uses Parabola's package blacklist"
arch=('any')
url="https://github.com/vmavromatis/$pkgname"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('6510e0bd2bf57cd842906ec2fee531fb4ca6f38a29bde45bdfa7570396c9f8d0')

_sourcedirectory="$pkgname-$_commit"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py build
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
