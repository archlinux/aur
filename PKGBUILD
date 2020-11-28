# Maintainer: Arsen Musayelyan <moussaelianarsen@gmail.com>
pkgname=pak-config-pacman-git
pkgver=r20.dbd6a31
pkgrel=1
pkgdesc="A pacman config for pak"
arch=('x86_64')
url="https://gitlab.com/moussaelianarsen/pak"
license=('GPL3')
depends=('aptman-git')
replaces=('pak-config-pacman')
provides=('pak-config')
source=("git+https://gitlab.com/moussaelianarsen/pak.git")
md5sums=('SKIP')
conflicts=('pak-config-yay-git')

pkgver() {
    cd "$srcdir/pak"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/pak"
	install -Dm644 plugins/pacman/pak.cfg $pkgdir/etc/pak.cfg
	mkdir -p $pkgdir/etc/pak.d
	install -Dm644 plugins/snap/pak.cfg $pkgdir/etc/pak.d/snap.cfg
	install -Dm644 plugins/apt/pak.cfg $pkgdir/etc/pak.d/apt.cfg
	install -Dm644 plugins/zypper/pak.cfg $pkgdir/etc/pak.d/zypper.cfg
	install -Dm644 plugins/yay/pak.cfg $pkgdir/etc/pak.d/yay.cfg
	install -Dm644 plugins/brew/pak.cfg $pkgdir/etc/pak.d/brew.cfg
	install -Dm644 plugins/aptitude/pak.cfg $pkgdir/etc/pak.d/aptitude.cfg
}
