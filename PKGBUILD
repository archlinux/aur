# Maintainer: C Anthony Risinger
# Contributor: Michael Goehler
# Contributor: Dave Reisner
pkgname='mkinitcpio-btrfs'
pkgver=0.4.3
pkgrel=1
pkgdesc='mkinitcpio hook containing advanced features for btrfs-based root devices'
url='https://github.com/xtfxme/mkinitcpio-btrfs'
arch=('any')
license=('BSD')
install="${pkgname}.install"
depends=('mkinitcpio>=0.9.0' 'btrfs-progs' 'kexec-tools')
backup=('etc/default/btrfs_advanced')
source=('btrfs_hook' 'btrfs_install' 'btrfs_config')

package() {
    install -o root -g root -D ${srcdir}/btrfs_install ${pkgdir}/usr/lib/initcpio/install/btrfs_advanced
    install -o root -g root -D ${srcdir}/btrfs_hook    ${pkgdir}/usr/lib/initcpio/hooks/btrfs_advanced
    install -o root -g root -D ${srcdir}/btrfs_config  ${pkgdir}/etc/default/btrfs_advanced
}

md5sums=('0e2b0a9bebfca0ebc2145cc6b2c0de76'
         'dc4bf193c9581625a5623d26f6096183'
         '73806b834c9fa8a8bb39d0201c63f21a')
