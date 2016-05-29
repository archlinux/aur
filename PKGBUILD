# Maintainer: shellkr <revoltism+AUR$gmail.com>

pkgname=minetest-usrdir_patch
pkgver=0.0.1
pkgrel=1
pkgdesc='A patch and a pacman-hook to fix a bug in Minetest not dicovering /usr/share/minetest'
arch=('any')
license=('GPL')
depends=('minetest')
source=($pkgname.patch $pkgname.hook)
md5sums=('4d034e96cc8823530874a472daa1242f' 
	 '87aebfe99cadcba1bc63c331f3746d00')

package() {
	cd "$srcdir"
	install -D -m755 minetest-usrdir_patch.hook "$pkgdir/etc/pacman.d/hooks/minetest-usrdir_patch.hook"
	install -D -m755 minetest-usrdir_patch.patch "$pkgdir/usr/share/libalpm/scripts/minetest-usrdir_patch.patch"
}

