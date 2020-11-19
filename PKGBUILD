# Maintainer: Tim Cooper <tim.cooper@layeh.com>
pkgname=kjv-git
pkgver=r29.068b373
pkgrel=1
pkgdesc="Read the Bible, God's Word, from your terminal"
arch=(x86_64)
depends=(less readline)
makedepends=(git)
url="https://github.com/bontibon/kjv"
license=('custom:Public Domain')
source=('kjv::git+https://github.com/bontibon/kjv.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 kjv $pkgdir/usr/bin/kjv
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
