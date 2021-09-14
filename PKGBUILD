# Maintainer: Xylight <email redacted>
pkgname=xaur
pkgver=1.1
pkgrel=2
epoch=
pkgdesc="A simple, lightweight AUR helper. (in beta)"
arch=('x86_64')
url="https://github.com/Xyphyn/xaur"
license=('GPL')
depends=('python')
makedepends=('pyinstaller' 'git')
source=("xaur::git://github.com/Xyphyn/xaur.git")
noextract=()
md5sums=('SKIP')

build() {
	cd "$pkgname"
	pyinstaller --onefile main.py install.py search.py ANSI.py
}

package() {
	cd "$pkgname"
	install -Dm755 ./dist/main "$pkgdir/usr/bin/xaur"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
}
