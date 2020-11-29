pkgname=key-mapper-git
pkgver=0.1.0
pkgrel=1
pkgdesc="A tool to change and program the mapping of your input device buttons."
arch=('any')
url="https://github.com/sezanzeb/key-mapper/"
license=('GPL3')
depends=('python-gobject' 'python-dbus' 'python-evdev')
makedepends=('git' 'python-setuptools')
provides=('key-mapper')
conflicts=('key-mapper')
source=("git+https://github.com/sezanzeb/key-mapper.git")
md5sums=('SKIP')
_gitname="key-mapper"

pkgver() {
	cd "$srcdir"/"$_gitname"
	git describe --tags | sed 's/-/+/g'
}

build() {
	cd "$srcdir"/"$_gitname"
	python3 setup.py build
}

package() {
	cd "$srcdir"/"$_gitname"
	python3 setup.py install --root=$pkgdir
}

