# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: gato_lento <vukk.euob at gmail dot com>
# Contributor: James W. Barnett <james at wbarnett dot us>

pkgname=grub-btrfs
pkgver=3.4
pkgrel=1
pkgdesc="Include btrfs snapshots in GRUB boot options"
arch=("any")
url="https://github.com/Antynea/grub-btrfs"
license=("GPL3")
depends=("btrfs-progs" "grub")
optdepends=("snapper: Snapper support")
conflicts=("grub-btrfs-git")
source=("https://github.com/Antynea/grub-btrfs/archive/v${pkgver}.tar.gz")
sha256sums=('42cebf0630e65563ef9d9063fe3e369109c9560e6b8248ac27450471a78fe843')
install="grub-btrfs.install"
backup=("etc/grub.d/41_snapshots-btrfs_config")

package() {
    cd $pkgname-$pkgver
    install -Dm 755 "41_snapshots-btrfs" "${pkgdir}/etc/grub.d/41_snapshots-btrfs"
    install -Dm 755 "41_snapshots-btrfs_config" "${pkgdir}/etc/grub.d/41_snapshots-btrfs_config"
    install -Dm 644 "localisation/fr/grub-btrfs-git.mo" "${pkgdir}/usr/share/locale/fr/LC_MESSAGES/grub-btrfs-git.mo"
    install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/grub-btrfs/LICENSE"
    install -Dm 644 "10-update_grub.conf" "${pkgdir}/etc/systemd/system/snapper-timeline.service.d/10-update_grub.conf"
    install -Dm 644 "10-update_grub.conf" "${pkgdir}/etc/systemd/system/snapper-cleanup.service.d/10-update_grub.conf"
}

# vim:set ts=4 sw=4 et:
