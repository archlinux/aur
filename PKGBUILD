# Maintainer: TBK <aur at jjtc dot eu>
# Contributor: TBK <aur at jjtc dot eu>

pkgname=initify
pkgver=r12.f9ccbb1
pkgrel=1
pkgdesc='Convert systemd services to OpenRC init-scripts.'
url='https://github.com/goose121/initify'
arch=('any')
license=('MIT')
depends=('perl')
source=("$pkgname::git+https://github.com/goose121/initify.git")
sha512sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 initify.pl "$pkgdir"/usr/bin/initify
	install -Dm755 cronify.pl "$pkgdir"/usr/bin/cronify
}
