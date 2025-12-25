# Maintainer: sezanzeb b8x45ygc9@mozmail.com
# Contributor: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=input-remapper-git
_pkgname=${pkgname%-git}
pkgver=2.2.0.r9.g0e1e0be9
pkgrel=1
pkgdesc="A tool to change and program the mapping of your input device buttons."
arch=('any')
url="https://github.com/sezanzeb/input-remapper/"
license=('GPL-3.0-or-later')
depends=('gtk3' 'gtksourceview4' 'python-cairo' 'python-evdev' 'python-gobject' 'python-packaging' 'python-psutil' 'python-pydantic' 'python-dasbus')
optdepends=('xorg-xmodmap: symbol names matching the keyboard layout')
makedepends=('git' 'python-pip')
provides=("$_pkgname")
conflicts=("$_pkgname" 'key-mapper')
source=("$_pkgname::git+https://github.com/sezanzeb/input-remapper.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$_pkgname"
	python3 -m install --root $pkgdir
}
