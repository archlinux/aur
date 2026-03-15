# PKGBUILD
pkgname=rbtr-git
pkgver=r2.d0c2325
pkgrel=1
pkgdesc="A simple scheduler for generating btrfs snapshots"
arch=('any')
url="https://gitlab.com/vbarch/rbtr"
license=('MIT')
depends=('btrfs-progs')
makedepends=('git')
source=("$pkgname::git+https://gitlab.com/vbarch/rbtr.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 rbtr-backup.sh "$pkgdir/usr/bin/rbtr-backup.sh"
	install -Dm755 rbtr-generate.sh "$pkgdir/usr/bin/rbtr-generate.sh"
	install -Dm755 rbtr-clean.sh "$pkgdir/usr/bin/rbtr-clean.sh"
	install -Dm755 rbtr-init.sh "$pkgdir/usr/bin/rbtr-init.sh"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
