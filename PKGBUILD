# Maintainer: system64 <system64fumo@protonmail.com>

pkgname=sysauth
pkgver=2025.08.03
pkgrel=1
pkgdesc="Simple authentication popup"
arch=('aarch64' 'x86_64')
url="https://github.com/System64fumo/sysauth"
license=('WTFPL')
groups=('sysshell')
depends=('gtkmm-4.0' 'gtk4-layer-shell' 'polkit')
source=("git+https://github.com/System64fumo/sysauth")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	git show -s --format=%cd --date=format:%Y.%m.%d $(git rev-parse HEAD)
}

build() {
	cd "${pkgname}"
	make
}

package() {
	cd "${pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
