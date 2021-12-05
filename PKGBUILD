# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Maintainer: librewish <librewish@gmail.com>

pkgname=snapper-support
pkgver=1.0.1
pkgrel=1
pkgdesc='Support package for enabling Snapper with snap-pac and grub-btrfs support'
arch=(any)
url='https://gitlab.com/garuda-linux/packages/stable-pkgbuilds/snapper-support'
license=(GPL3)
depends=(snapper snap-pac grub-btrfs)
makedepends=(git)
conflicts=(timeshift-support timeshift timeshift-autosnap)
source=('snapper-template' 'grub-btrfs-snapper.path' 'grub-btrfs-snapper.service')
sha256sums=('877e2a68dd4d2dd15ec3846692a8b3a307e06804d82daae72c3059f9c2340cc1'
            '2df923558cda373f7c36daa86b458d2bf0918a70bdd4c3d14d7505e7f9193d91'
            '94f7aa790058ec52925f805b85a391458fea2a4c19387d5d8ad7d225baa64091')
install=$pkgname.install

package() {
    install -Dm644 snapper-template $pkgdir/etc/snapper/config-templates/snapper
    install -Dm644 grub-btrfs-snapper.path $pkgdir/usr/lib/systemd/system/grub-btrfs-snapper.path
    install -Dm644 grub-btrfs-snapper.service $pkgdir/usr/lib/systemd/system/grub-btrfs-snapper.service
}
