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
md5sums=('6bd76d173b3da08d45f5f438c583a2f9')

_sourcedirectory="$pkgname-$_commit"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py build
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
