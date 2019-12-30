# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=nemo-deja-dup-git
pkgver=r2.f99427f
pkgrel=4
pkgdesc="Déjà Dup Actions for Nemo File Manager"
arch=('any')
url="https://github.com/erickj/nemo-actions"
license=('GPL')
depends=('nemo' 'deja-dup')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/erickj/nemo-actions.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/nemo-actions"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/nemo-actions"
	install -Dm755 deja-dup_restore-missing.nemo_action -t "$pkgdir/usr/share/nemo/actions"
	install -Dm755 deja-dup_revert.nemo_action -t "$pkgdir/usr/share/nemo/actions"
}
