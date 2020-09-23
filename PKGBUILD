# Maintainer: bajaco <admin@agyx.org>
pkgname=hotbox-git
pkgver=0.0.2
pkgrel=1
pkgdesc="Python3-based CLI hotkey configurator for Openbox"
arch=('any')
url="https://github.com/bajaco/hotbox"
license=('MIT')
depends=(python)
makedepends=('python-setuptools' 'git')
source=("git://github.com/bajaco/hotbox.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/hotbox"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	}


build() {
	cd "$srcdir/hotbox"
	python setup.py build
}

package() {
	cd "$srcdir/hotbox"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
