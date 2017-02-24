# Contributor: moparisthebest <admin dot archlinux AT moparisthebest dot com>

pkgname=cryptsetup-multidisk
pkgver=1.0
pkgrel=1
pkgdesc='Handle multiple encrypted root devices'
arch=('any')
license=('GPL3')
author='moparisthebest'
url="https://github.com/$author/archlinux_encrypthook"
source=("https://github.com/$author/archlinux_encrypthook/archive/v$pkgver.tar.gz" "https://github.com/$author/archlinux_encrypthook/releases/download/v$pkgver/v$pkgver.tar.gz.asc")
validpgpkeys=('81F1C22DD41109D4A9C0A7B5B070F8D97D1A0BBA') # moparisthebest <admin AT moparisthebest.com>
sha256sums=('e38eed40eadfa7dadd697cbe6d06845edad35fcc37f910e5323d5b89fce5ef67'
            'SKIP')

package() {
	cd "archlinux_encrypthook-$pkgver"
	install -D -m644 encrypt_hook    "${pkgdir}"/usr/lib/initcpio/hooks/encrypt-multidisk
	install -D -m644 encrypt_install "${pkgdir}"/usr/lib/initcpio/install/encrypt-multidisk
}
