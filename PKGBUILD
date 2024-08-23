# Maintainer: bl4ckw1d0w bl4ckw1d0w.github@gmail.com
pkgname=dracut-network-manager-wireless-iwlwifi-ath9k
pkgver=1.0.0
pkgrel=1
pkgdesc="A custom dracut module for initializing Wi-Fi connections during the early boot process."
arch=('any')
url="https://github.com/b14ckw1d0w/dracut-network-manager-wireless"
license=('Apache')
depends=('dracut' 'networkmanager' 'wpa_supplicant' 'clevis')
source=("dracut-network-manager-wireless-iwlwifi-ath9k-v$pkgver.tar.gz::https://raw.githubusercontent.com/b14ckw1d0w/dracut-network-manager-wireless/main/aur/dracut-network-manager-wireless-iwlwifi-ath9k-v$pkgver.tar.gz")
sha256sums=('e529ef35230a647c351dc186b8e697144010c3f8adf7c4f741b481dc9071451e')

package() {
    # Extract and install the files to the package directory
    install -dm755 "$pkgdir/etc/dracut.conf.d"
    install -m644 "$srcdir/etc/dracut.conf.d/network-manager-wireless.conf" "$pkgdir/etc/dracut.conf.d/"

    install -dm755 "$pkgdir/usr/lib/dracut/modules.d/30network-manager-wireless"
    install -m755 "$srcdir/usr/lib/dracut/modules.d/30network-manager-wireless/module-setup.sh" "$pkgdir/usr/lib/dracut/modules.d/30network-manager-wireless/"
}
