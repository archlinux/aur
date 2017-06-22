# Maintainer: Andrei Alexeyev <akari@alienslab.net>

pkgname=envlinkfs-git
pkgver=0.1.r2.b731de6
pkgrel=1
pkgdesc="FUSE filesystem that exposes environment variables as symbolic links"
arch=('any')
url="https://github.com/Akaricchi/envlinkfs"
license=('WTFPL')
groups=()
depends=('python' 'python-fusepy')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/Akaricchi/envlinkfs')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname%-git}/COPYING"
}
