# Maintainer: Manuel Mendez <mmendez534@gmail.com>

pkgname=u2f-udev-rules-git
pkgver=r177.c32e7a6
pkgrel=2
pkgdesc="UDEV file for U2F devices"
arch=('any')
url="https://github.com/Yubico/libu2f-host"
license=('GPL3')
depends=('udev')
conflicts=('libu2f-host-git')
source=('git+https://github.com/Yubico/libu2f-host'
	'u2f-udev-rules.install')
sha512sums=('SKIP'
	'5b4d02d8ef479bb07343eb4bf80ef497ac81472edff610006f06fce185f9ee465210c99da2a4a82dcf1e2c67299c04923ef9a93c111c20425c19fdc7d6cc02c6')

pkgver() {
	cd "$srcdir/libu2f-host"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -D -m644 -t "$pkgdir/usr/lib/udev/rules.d" "$srcdir/libu2f-host/70-u2f.rules"
}
