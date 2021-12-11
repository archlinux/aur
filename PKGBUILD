# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
pkgname=pamac-appstream-hook
pkgver=1
pkgrel=1
pkgdesc="Pacman hook for cleaning up Appstream data from tags that Pamac can't handle."
arch=(any)
url="https://aur.archlinux.org/packages/pamac-appstream-hook"
license=('GPL')
source=(pamac-fix-appstream-data.hook
        pamac-fix-appstream-data.sh)
sha256sums=('4556916fcfcf1548d1ac2c9c37eb2e3b36559675ce4b50a96bc5b62da9d67780'
            '437a02357705f96f98c862ef3a95d22960e0a4b042003e81dbcab4730cee956e')

package() {
	cd "$srcdir"
    install -Dm644 pamac-fix-appstream-data.hook "$pkgdir/usr/share/libalpm/hooks/80-pamac-fix-appstream-data.hook"
    install -Dm755 pamac-fix-appstream-data.sh   "$pkgdir/usr/share/$pkgname/pamac-fix-appstream-data.sh"
}
