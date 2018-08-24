# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname='emoji-keyboard-edam-git'
pkgver=r38.af418a0
pkgrel=1
pkgdesc="Virtual keyboard-like emoji picker for Linux (edam's fork)."
arch=('i686' 'x86_64')
url="https://github.com/edam/emoji-keyboard"
license=('GPL3')
groups=()
depends=('python-gobject' 'libappindicator-gtk3' 'python-evdev' 'python-xlib')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://github.com/edam/emoji-keyboard.git#branch=master")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir/" --optimize=1
}
