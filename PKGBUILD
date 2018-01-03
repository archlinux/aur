pkgname=snap-pac-grub
pkgver=1.0.1
pkgrel=1
pkgdesc="Pacman hook to update GRUB entries for grub-btrfs after snap-pac made snapshots"
arch=('any')
license=('MIT')
depends=('snap-pac' 'grub-btrfs')
source=("zz_snap-pac-grub-post.hook"
        "zz_snap-pac-grub-post.hook.sig"
        "grub-mkconfig"
        "grub-mkconfig.sig"
        "PKGBUILD.sig")
sha512sums=('e9eb6cd337d14d2d8286933b00724df56a0936407dcd8f4c4f96c0e394d968bc207fb1d1ec82dace6b1a34a05a58d6e12d25fcfc58e2d2f8da75cef1c8c3447e'
            'SKIP'
            '418a0bf400834a9bfae6f370e94ec067539fa1245d5a9ae97da661f2556b17fb83af809558b610ad75a04a182b80e37e2c718ae20da855df60a0339faad1417a'
            'SKIP'
            'SKIP')
validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')

package() {
  install -Dm755 grub-mkconfig -t "$pkgdir/usr/share/libalpm/hooks.bin/snap-pac-grub/"
  install -Dm644 zz_snap-pac-grub-post.hook -t "$pkgdir/usr/share/libalpm/hooks/"
}
