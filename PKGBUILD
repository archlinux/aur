# Maintainer: Ivan Kolesnikov <kiv.apple@gmail.com>
pkgname=qvkbd-git
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Qt Virtual Keyboard"
arch=(i686 x86_64)
url="https://github.com/KivApple/qvkbd"
license=('GPL3')
groups=()
depends=('qt5-x11extras' 'qt5-declarative')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/KivApple/qvkbd")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd "$pkgname"
	qmake
	make
}

package() {
	cd "$pkgname"
	install -D -m 0755 qvkbd "$pkgdir/usr/bin/qvkbd"
	install -D -m 0755 qvkbd.desktop "$pkgdir/usr/share/applications/qvkbd.desktop"
	install -D -m 0644 icons/keyboard.svg "$pkgdir/usr/share/icons/hicolor/scalable/qvkbd.svg"
}
