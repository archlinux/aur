# Maintainer: autinerd <autinerd-arch at kuyateh dot eu>

pkgname=arcticons-icon-theme-git
pkgver=9.2.4.0.r0.g7a1c1519
pkgrel=1
pkgdesc='A monotone line-based icon pack for android - freedesktop version (git version)'
arch=('any')
url='https://github.com/Arcticons-Team/Arcticons-Linux'
license=('GPL3')
options=(!strip)
provides=('arcticons-icon-theme')
conflicts=('arcticons-icon-theme')
source=('git+https://github.com/Arcticons-Team/Arcticons-Linux.git')
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
