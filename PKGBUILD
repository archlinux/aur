# Maintainer: gardar <aur@gardar.net>
# Contributor: gardar <aur@gardar.net>
pkgname=zfsbootmenu
pkgver=2.3.0
pkgrel=1
pkgdesc="ZFS bootloader for root-on-ZFS systems"
license=('MIT')
url="https://github.com/zbm-dev/$pkgname"
arch=('x86_64')
depends=('zfs' 'kexec-tools' 'fzf' 'bash' 'mbuffer' 'ncurses' 'perl-sort-versions' 'perl-boolean' 'perl-yaml-pp' 'openssl-1.1')
optdepends=('dracut' 'mkinitcpio' 'efibootmgr' 'refind' 'syslinux' 'grub')
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha512sums=('9b8e2d5ea258a32cd09a9382faaa21beea54f2ed825fa747f10ffe0b9f191c257b023019ec76dc882e649e8ea6fcd8e310632bba6c783228c594e3d0fee2c9c8')
backup=("etc/${pkgname}/config.yaml" "etc/${pkgname}/mkinitcpio.conf" "etc/${pkgname}/dracut.conf.d/omit-drivers.conf" "etc/${pkgname}/dracut.conf.d/${pkgname}.conf")

package() {
        cd "$pkgname-$pkgver"
        make DESTDIR="$pkgdir"
        install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
