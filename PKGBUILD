# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: gato_lento <vukk.euob at gmail dot com>
# Contributor: James W. Barnett <james at wbarnett dot us>

pkgname=grub-btrfs
pkgver=3.5
pkgrel=2
pkgdesc='Include btrfs snapshots in GRUB boot options'
arch=('any')
url='https://github.com/Antynea/grub-btrfs'
license=('GPL3')
depends=('btrfs-progs' 'grub')
optdepends=('snapper: Snapper support')
backup=('etc/grub.d/41_snapshots-btrfs_config')
source=("https://github.com/Antynea/grub-btrfs/archive/v$pkgver.tar.gz")
sha256sums=('96ba59bc1cd46efe3c4e4352dabb61702a37699b2228cacdc8dccedebbfe0331')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/etc/grub.d" 41_snapshots-btrfs
    install -Dm755 -t "$pkgdir/etc/grub.d" 41_snapshots-btrfs_config
    install -Dm644 -t "$pkgdir/usr/share/locale/fr/LC_MESSAGES" localisation/fr/grub-btrfs-git.mo
    install -Dm644 -t "$pkgdir/usr/share/licenses/grub-btrfs" LICENSE
    install -Dm644 -t "$pkgdir/usr/lib/systemd/system/snapper-timeline.service.d" 10-update_grub.conf
    install -Dm644 -t "$pkgdir/usr/lib/systemd/system/snapper-cleanup.service.d" 10-update_grub.conf
}

# vim:set ts=4 sw=4 et:
