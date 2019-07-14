# Maintainer: Michael Kuc <michaelkuc6 at gmail dot com>
# Creator: Steven J. Core <42Echo6Alpha at gmail dot com>
pkgname=configui-git
pkgver=0.1
pkgrel=2
epoch=
pkgdesc="A GUI for changing themes"
arch=('any')
url="https://gitlab.com/sj1k/configui"
license=('GPL3')
groups=()
depends=('python'
	 'python-dbus'
	 'pygtk'
	 'python-yaml')
makedepends=()
checkdepends=()
optdepends=()
provides=('configui')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://gitlab.com/sj1k/configui.git"
	"configui.py.diff")
noextract=()
sha256sums=('SKIP'
	    '13672572699bbe6fffb7ad07536814f2dbcb7b5a128358a3083e7181463d8343')
validpgpkeys=()

build() {
	patch "$pkgname/configui.py" configui.py.diff
	cd "$pkgname"
	chmod +x configui.py
}

check() {
	cd "$pkgname"
	# ./configui.py --help
}

package() {
	cd "$pkgname"
	install -Dm755 -t "${pkgdir}/usr/bin" configui.py
}
