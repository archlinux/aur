# Maintainer: autinerd <autinerd-arch at kuyateh dot eu>

pkgname=arcticons-icon-theme-git
pkgver=8.0.6.0.r0.g6d5e992d
pkgrel=2
pkgdesc='A monotone line-based icon pack for android - freedesktop version (git version)'
arch=('any')
url='https://github.com/Donnnno/Arcticons-Linux'
license=('GPL3')
options=(!strip)
provides=('arcticons-icon-theme')
conflicts=('arcticons-icon-theme')
source=('git+https://github.com/Donnnno/Arcticons-Linux.git')
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/Arcticons-Linux"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/Arcticons-Linux"
	install -d "$pkgdir/usr/share/icons"
	cp -r arcticons-light arcticons-dark "$pkgdir/usr/share/icons"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
