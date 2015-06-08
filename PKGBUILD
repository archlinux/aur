# Contributor: Sapphira Armageddos <shadowkyogre@aim.com>
pkgname=locky-git
pkgver=20140825
pkgrel=1
pkgdesc="Locks all X sessions upon suspend or hibernate with xscreensaver or a custom command."
arch=('any')
url="https://github.com/ShadowKyogre/Locky"
license=('GPL')
depends=('xorg-xdpyinfo')
optdepends=('systemd: for systemd sleep locking' 'pm-utils: for systemd-less sleep locking')
makedepends=('git')
source=('git://github.com/ShadowKyogre/Locky.git')
backup=(etc/lockyrc)

# trick re-determining the build revision and, or entertain the hidden
# makepkg option --forcever, huh
pkgver() {
	date +%Y%m%d
}

package() {
	cd ${srcdir}/Locky

	install -Dm755 67locky ${pkgdir}/etc/pm/sleep.d/67locky
	install -Dm644 locky.service ${pkgdir}//usr/lib/systemd/system/locky.service
	install -Dm644 lockyrc ${pkgdir}/etc/lockyrc
}


# vim:set ts=2 sw=2 et:
md5sums=('SKIP')
