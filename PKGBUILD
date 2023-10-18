# Maintainer: gardar <aur@gardar.net>
# Contributor: gardar <aur@gardar.net>
pkgname=zfsbootmenu
pkgver=2.2.1
pkgrel=1
pkgdesc="ZFS bootloader for root-on-ZFS systems"
license=('MIT')
url="https://github.com/zbm-dev/$pkgname"
arch=('x86_64')
depends=('zfs' 'kexec-tools' 'fzf' 'bash' 'mbuffer' 'ncurses' 'perl-sort-versions' 'perl-boolean' 'perl-yaml-pp' 'openssl-1.1')
optdepends=('dracut' 'mkinitcpio' 'efibootmgr' 'refind' 'syslinux' 'grub')
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha256sums=('02b7e8b5573c843042c9f4164209e012790c05665c463f547bed03eb0821e348')
backup=("etc/${pkgname}/config.yaml" "etc/${pkgname}/mkinitcpio.conf" "etc/${pkgname}/dracut.conf.d/omit-drivers.conf" "etc/${pkgname}/dracut.conf.d/${pkgname}.conf")

package() {
        cd "$pkgname-$pkgver"
        make DESTDIR="$pkgdir"
        install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
