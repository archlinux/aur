# Maintainer: gato_lento <vukk.euob at gmail dot com>
# Contributor: James W. Barnett <james at wbarnett dot us>

pkgname=grub-btrfs
pkgver=2.0.1
pkgrel=1
pkgdesc="Include btrfs snapshots in GRUB boot options"
arch=('any')
url="https://github.com/Antynea/grub-btrfs"
license=('GPL3')
depends=('btrfs-progs' 'grub')
optdepends=('snapper: Snapper support')
conflicts=('grub-btrfs-git')
source=("https://github.com/Antynea/grub-btrfs/archive/v${pkgver}.tar.gz")
sha256sums=('2da27e6660b9e40cb5181d7b7f4dfc5742ab58d2ce755025b1c3ea6cc3d0ec48')

package() {
  cd $pkgname-$pkgver
  install -Dm 755 "41_snapshots-btrfs" "${pkgdir}/etc/grub.d/41_snapshots-btrfs"
  install -Dm 644 "localisation/fr/grub-btrfs-git.mo" "${pkgdir}/usr/share/locale/fr/LC_MESSAGES/grub-btrfs-git.mo"
  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/grub-btrfs/LICENSE"
}
