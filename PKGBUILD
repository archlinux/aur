pkgname=gpgunlock
pkgver=1
pkgrel=8
pkgdesc="mkinitcpio hook for cryptsetup to unlock the root partition from a passphrase encrypted
as /rootkey.gpg, can be genreated with setbootpassword, usefull to boot from a non-encrypted usb
key."
arch=(any)
depends=(mkinitcpio cryptsetup gnupg)
source=(hook hook_install rootkey.sh)
md5sums=(SKIP SKIP SKIP)
isntall=install

package() {
    cd "$srcdir"
	install -Dm644 hook "$pkgdir"/usr/lib/initcpio/hooks/gpgunlock
	install -Dm644 hook_install "$pkgdir"/usr/lib/initcpio/install/gpgunlock
    
    install -Dm755 rootkey.sh "$pkgdir"/usr/bin/setbootpassword
}
