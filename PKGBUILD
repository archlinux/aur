# Maintainer: James W. Barnett <james at wbarnett dot us>

pkgname=grub-btrfs
pkgver=1.9.1
pkgrel=1
pkgdesc="grub-btrfs, Include btrfs snapshots at boot options. (grub menu)"
arch=('any')
url="https://github.com/Antynea/grub-btrfs"
license=('GPL3')
depends=('btrfs-progs' 'grub')
conflicts=('grub-btrfs-git')
source=('https://github.com/Antynea/grub-btrfs/archive/v'$pkgver'.tar.gz')
md5sums=('c4a0e859077581b6498125bcb572c3a1')

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 "41_snapshots-btrfs" "${pkgdir}/etc/grub.d/41_snapshots-btrfs"
	install -Dm 644 "localisation/fr/grub-btrfs-git.mo" "${pkgdir}/usr/share/locale/fr/LC_MESSAGES/grub-btrfs-git.mo"
    install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
