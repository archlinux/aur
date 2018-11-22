# Maintainer: Chris Lane <aur at chrislane dot com>
# Contributor: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname='emoji-keyboard-edam-git'
pkgver=r38.af418a0
pkgrel=2
pkgdesc="Virtual keyboard-like emoji picker for Linux (edam's fork)."
arch=('any')
url="https://github.com/edam/emoji-keyboard"
license=('GPL3')
depends=('python-gobject' 'python-evdev' 'python-xlib')
makedepends=('git' 'python-setuptools')
optdepends=('libappindicator-gtk3: app indicator support (e.g. Unity, KDE, Systray)')
provides=('emoji-keyboard')
conflicts=('emoji-keyboard' 'emoji-keyboard-git')
install=
source=("${pkgname%-git}::git+https://github.com/edam/emoji-keyboard.git#branch=master")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir/" --optimize=1
}
