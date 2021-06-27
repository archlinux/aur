# Maintainer: Simon Zack <simonzack@gmail.com>
# Contributor: Toasty <toastyyogurttime@gmail.com>
# Contributor: Stephen304 <stephen304@gmail.com>
pkgname=caffeine
pkgver=2.9.8
pkgverfull="${pkgver}+684~ubuntu21.04.1"
pkgrel=1
pkgdesc="Prevents the desktop becoming idle in full-screen mode."
arch=(any)
url="https://launchpad.net/caffeine"
license=('GPL3')
depends=(gtk3 python-gobject python-ewmh python-xlib)
makedepends=()
optdepends=('libayatana-appindicator: caffeine-indicator (tray applet) support')
provides=(caffeine-bzr caffeine-ng caffeine-oneclick caffeine-systray)
conflicts=(caffeine-bzr caffeine-ng caffeine-oneclick caffeine-systray)
replaces=(caffeine-oneclick caffeine-systray)
source=("https://launchpad.net/~caffeine-developers/+archive/ubuntu/ppa/+sourcefiles/${pkgname}/${pkgverfull}/${pkgname}_${pkgverfull}.tar.xz")
md5sums=('SKIP')

build() {
	cd "$srcdir"/"$pkgname-$pkgverfull"
	python setup.py build
}

check() {
	cd "$srcdir"/"$pkgname-$pkgverfull"
	python setup.py check
}

package() {
	cd "$srcdir"/"$pkgname-$pkgverfull"
	python setup.py install --root="$pkgdir"
	cd "$pkgdir"
	chmod -R +rx *
}
