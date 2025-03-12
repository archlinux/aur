# Maintainer: Dimitri Gigot <dimgigot@gmail.com>
pkgname=oscar-launcher-git
pkgver=0.1.2
pkgrel=1
pkgdesc="One Simple Configurable Action Runner"
arch=(x86_64)
url="https://github.com/dimitri-gigot/oscar-launcher"
license=('MIT')
depends=(python3 python-dbus gtk4)
makedepends=(git)
provides=(oscar-launcher)
conflicts=()

source=("git+https://github.com/dimitri-gigot/oscar-launcher")
md5sums=('SKIP')

package() {
	cd "oscar-launcher"

	install -d "$pkgdir/etc/oscar-launcher"
    cp -r "$srcdir/oscar-launcher/.config/oscar-launcher/." "$pkgdir/etc/oscar-launcher/"

	install -d "$pkgdir/usr/share/oscar-launcher"
	cp -r "$srcdir/oscar-launcher/src/." "$pkgdir/usr/share/oscar-launcher"
	install -Dm755 src/oscar-launcher "$pkgdir/usr/share/oscar-launcher"

	install -d "$pkgdir/usr/bin"
	ln -s "/usr/share/oscar-launcher/oscar-launcher" "$pkgdir/usr/bin/oscar-launcher"
}