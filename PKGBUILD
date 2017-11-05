# Maintainer: Your Name <youremail@domain.com>
pkgname=caffeine
pkgver=2.9.4
pkgrel=1
pkgdesc="Prevents the desktop becoming idle in full-screen mode."
arch=(any)
url="https://launchpad.net/caffeine"
license=('GPL3')
depends=(gtk3 python-gobject python-ewmh python-setuptools python-xlib)
makedepends=()
optdepends=('libappindicator-gtk3: caffeine-indicator (tray applet) support')
provides=(caffeine-bzr caffeine-ng caffeine-oneclick caffeine-systray)
conflicts=(caffeine-bzr caffeine-ng caffeine-oneclick caffeine-systray)
replaces=(caffeine-oneclick caffeine-systray)
source=("https://launchpad.net/~caffeine-developers/+archive/ubuntu/ppa/+files/${pkgname}_${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
	cd "$srcdir"/"$pkgname"
	python setup.py build
}

check() {
	cd "$srcdir"/"$pkgname"
	python setup.py check
}

package() {
	cd "$srcdir"/"$pkgname"
	python setup.py install --root="$pkgdir"
	cd "$pkgdir"
	chmod -R +rx *
}
