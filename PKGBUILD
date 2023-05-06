# Maintainer dalto <dalto at fastmail dot com>
# Contributor: Joona P <jonppep at gmail dot com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
# Contributor: Anty <anty_fab at hotmail dot fr>
# Contributor: Evan Anderson <evananderson@thelinuxman.us>

_gitname=grub-btrfs
pkgname=$_gitname-git
pkgver=4.12.r47.g9a8a1b7
pkgrel=1
pkgdesc="Include btrfs snapshots at boot options (grub menu)"
arch=('any')
url="https://github.com/Antynea/grub-btrfs"
license=('GPL3')
depends=('grub' 'btrfs-progs' 'bash' 'gawk')
makedepends=('git')
conflicts=('grub-btrfs')
provides=('grub-btrfs')
source=('git+https://github.com/Antynea/grub-btrfs.git')
md5sums=('SKIP')

pkgver() {
	cd $_gitname
	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd "$_gitname"
	make DESTDIR="${pkgdir}" INITCPIO=true GRUB_UPDATE_EXCLUDE=true install
}
