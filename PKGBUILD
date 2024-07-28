# Maintainer: dr460nf1r3 <root at dr460nf1r3 dot org>
# Contributor: librewish <librewish@gmail.com>

pkgname=snapper-support
pkgver=1.1.2
pkgrel=3
pkgdesc='Support package for enabling Snapper with snap-pac and grub-btrfs support'
arch=(any)
url='https://gitlab.com/garuda-linux/pkgbuilds/-/tree/main/snapper-support'
license=(GPL3)
depends=(snapper snap-pac grub-btrfs)
makedepends=(git)
conflicts=(timeshift-support timeshift timeshift-autosnap)
source=('snapper-template' 'grub-btrfs-snapper.path' 'grub-btrfs-snapper.service')
sha256sums=('4532cc671d41e3d98da33e9193fb39d86fd687d6d081bfa4d2e36975730acaa8'
            '2df923558cda373f7c36daa86b458d2bf0918a70bdd4c3d14d7505e7f9193d91'
            'ab8131cdb777e8f8c1cbf49b14c2c452788529c666e9f9aa523a52fcc576d1e0')
install=$pkgname.install

package() {
    install -Dm644 snapper-template $pkgdir/etc/snapper/config-templates/snapper
    install -Dm644 grub-btrfs-snapper.path $pkgdir/usr/lib/systemd/system/grub-btrfs-snapper.path
    install -Dm644 grub-btrfs-snapper.service $pkgdir/usr/lib/systemd/system/grub-btrfs-snapper.service
}
