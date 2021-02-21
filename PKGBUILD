# Maintainer: teamalpha5441
pkgname=ntfy-git
pkgver=v2.5.0.r68.g48baeb2
pkgrel=2
pkgdesc="A utility for sending push notifications to different backends (Pushover, Pushbullet, XMPP and various desktop notification systems)"
url="https://github.com/dschep/ntfy"
depends=('python' 'python-yaml' 'python-requests' 'python-appdirs' 'python-ruamel-yaml' 'python-setuptools' 'xorg-xprop')
makedepends=('python' 'git')
license=('GPL3')
arch=('any')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git");
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1 
}
