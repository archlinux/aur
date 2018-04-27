pkgname=snap-pac-grub
pkgver=1.0.4
pkgrel=1
pkgdesc="Pacman hook to update GRUB entries for grub-btrfs after snap-pac made snapshots"
arch=('any')
license=('MIT')
depends=('snap-pac' 'grub-btrfs')
source=("zz_snap-pac-grub-post.hook"
        "zz_snap-pac-grub-post.hook.sig"
        "grub-mkconfig"
        "grub-mkconfig.sig")
sha512sums=('e9eb6cd337d14d2d8286933b00724df56a0936407dcd8f4c4f96c0e394d968bc207fb1d1ec82dace6b1a34a05a58d6e12d25fcfc58e2d2f8da75cef1c8c3447e'
            'SKIP'
            'f05b90a1d55fc3d2a7413536a7d053c76cc9d955860e9f3b083bdb1c8b54df8a82ca8c0a68ab587a62bb6b0bf153082a1840512510a515e96f304f2a8def2faa'
            'SKIP')
validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')

package() {
  install -Dm755 grub-mkconfig -t "$pkgdir/usr/share/libalpm/hooks.bin/snap-pac-grub/"
  install -Dm644 zz_snap-pac-grub-post.hook -t "$pkgdir/usr/share/libalpm/hooks/"
}
