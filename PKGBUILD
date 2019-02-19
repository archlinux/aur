# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=nemo-deja-dup-git
_gitname=nemo-actions
pkgver=r2.f99427f
pkgrel=4
pkgdesc="Déjà Dup Actions for Nemo File Manager"
arch=('any')
url="https://github.com/erickj/$_gitname"
license=('GPL')
depends=('nemo' 'deja-dup')
source=("git+https://github.com/erickj/$_gitname.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_gitname"
    install -Dm755 deja-dup_restore-missing.nemo_action "$pkgdir/usr/share/nemo/actions/deja-dup_restore-missing.nemo_action"
    install -Dm755 deja-dup_revert.nemo_action "$pkgdir/usr/share/nemo/actions/deja-dup_revert.nemo_action"
}
