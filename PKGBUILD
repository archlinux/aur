# Maintainer: gardar <aur@gardar.net>
# Contributor: gardar <aur@gardar.net>
pkgname=zfsbootmenu
pkgver=3.0.0
pkgrel=1
pkgdesc="ZFS bootloader for root-on-ZFS systems"
license=('MIT')
url="https://github.com/zbm-dev/$pkgname"
arch=('x86_64')
depends=('zfs' 'kexec-tools' 'fzf' 'bash' 'mbuffer' 'ncurses' 'perl-sort-versions' 'perl-boolean' 'perl-yaml-pp' 'openssl')
optdepends=('dracut' 'mkinitcpio' 'efibootmgr' 'refind' 'syslinux' 'grub')
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha512sums=('ca10345d10f14a687b01e699a5bc2f3f7797c736bd90ec7a3f4cb7f2d7cf2481fb0871fa3b48807c17ec66e0ccf8eb8c2ead6e08c3e323987f8627d1f6866a97')
backup=("etc/${pkgname}/config.yaml" "etc/${pkgname}/mkinitcpio.conf" "etc/${pkgname}/dracut.conf.d/omit-drivers.conf" "etc/${pkgname}/dracut.conf.d/${pkgname}.conf")

package() {
        cd "$pkgname-$pkgver"
        make install DESTDIR="$pkgdir"
        install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
