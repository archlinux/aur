# Maintainer: Roberto Polverelli Monti <rpolverelli at gmail>
pkgname=mfetch-git
pkgver=v1.0.r0.8ecf7db
pkgrel=1
pkgdesc="Yet another minimal bash CLI fetchlike utility."
arch=('any')
url="https://gitlab.com/rpolve/mfetch"
license=('WTFPL')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=mfetch.install
source=('git+https://gitlab.com/rpolve/mfetch')
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "${pkgname%-git}"
	install -Dm755 "mfetch.sh" "$pkgdir/usr/bin/mfetch"
}
