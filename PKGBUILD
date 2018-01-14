pkgname=keyencrypt
pkgver=1.1.0
pkgrel=1
pkgdesc="mkinitpio hook to decrypt /rootkey.gpg, which is then fowarded to cryptsetup's hook
encrypt for root decryption, usefull to boot from a non-encrypted usb key."
arch=(any)
depends=(mkinitcpio cryptsetup gnupg)
conflicts=(gpgunlock)
source=(hook hook_install rootkey.sh)
md5sums=(SKIP SKIP SKIP)
install=install

package() {
    cd "$srcdir"
	install -Dm644 hook "$pkgdir"/usr/lib/initcpio/hooks/keyencrypt
	install -Dm644 hook_install "$pkgdir"/usr/lib/initcpio/install/keyencrypt
    
    install -Dm755 rootkey.sh "$pkgdir"/usr/bin/setbootpassword
}
