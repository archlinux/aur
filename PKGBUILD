# Maintainer: Stefan Gehr <stefangehr@protonmail.com>

pkgname=python-pexpect-git
pkgver="r1600.2532721"
pkgrel=1
pkgdesc='For controlling and automating applications'
arch=(any)
url='https://pexpect.readthedocs.org/en/stable/'
license=(MIT)
depends=(python python-ptyprocess)
makedepends=(git python)
conflicts=(python-pexpect)
source=("$pkgname"::"git+https://github.com/pexpect/pexpect")
sha512sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
