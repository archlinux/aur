# Maintainer: Fabio Sussarellu <sussarellu.fabio@gmail.com>
pkgname=bashtop-git
pkgver=r313.4bf71e6
pkgrel=1
pkgdesc="Resource monitor that shows usage and stats for processor, memory, disks, network and processes."
arch=('any')
url="https://github.com/aristocratos/bashtop"
license=('Apache')
depends=('bash')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/aristocratos/bashtop.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 "${pkgname%-git}" -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
