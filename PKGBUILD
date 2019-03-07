# Maintainer: Timo Schmiade <the_isz@gmx.de>
pkgname=('python-udcli')
pkgver=0.1.1
pkgrel=2
pkgdesc="udisks2 command-line interface with zsh completion, written in python3"
arch=('any')
url="https://gitlab.com/the_isz/udcli"
license=('GPL')
depends=('python' 'python-dbus' 'udisks2')
makedepends=('git')
source=("https://gitlab.com/the_isz/udcli/-/archive/$pkgver/udcli-$pkgver.tar.gz")
md5sums=("06b1ed71b13f0863148625bc46a54353")

package() {
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/zsh/site-functions"

	cd "$srcdir/udcli-$pkgver"
	install -m 755 code/udcli "$pkgdir/usr/bin"
	install -m 644 zsh/_udcli "$pkgdir/usr/share/zsh/site-functions"
}
