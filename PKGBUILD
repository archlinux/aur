# Maintainer: alessandro (gort818) <gort818@gmail.com>

pkgname=openjk-launcher
pkgver=0.2
pkgrel=1
pkgdesc='A launcher and installer for OpenJK the opensource engine for Star Wars Jedi Knight: Jedi Academy'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/gort818/${pkgname%-git}"
depends=('python3' 'python-gobject' 'gtk3' 'python-requests' 'python-pygame')
options=('!emptydirs')
source=("git://github.com/gort818/${pkgname%-git}.git")
sha1sums=('SKIP')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

pkgver() {
	cd "${pkgname%-git}"
	git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/${pkgname%-git}"
        python setup.py install --root="$pkgdir/" --optimize=1
}
