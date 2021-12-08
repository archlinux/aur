# Maintainer: bkacjios < blackops7799 at gmail dot com >
# Contributor: Jouni Rinne <l33tmmx swirlything gmail dot com>
pkgname=steamlink-raspberrypi
pkgver=1.1.85
pkgrel=2
pkgdesc="Steam Link app for RPi"
arch=('armv7h')
url="https://store.steampowered.com/steamlink/about"
license=('custom')
depends=('libjpeg6-turbo' 'libcec-rpi' 'curl' 'gnupg' 'xz' 'zenity')
source=("https://media.steampowered.com/steamlink/rpi/latest/steamlink.deb"
        "56-steamlink.rules"
        "uinput.conf")
sha256sums=('4ce31c0f7a73fdb2205a981e2f5d59e55e3bbe4cbab2917f1faa1cf25fd3e879'
            '5145864d88180f7d5afcdd7272ff8ff0bc6826a6c3123e1a90f6fe86e4b5e58b'
            'a771c9695d7283f7771adc00b680bd27391e6ac00e9fd026f4796067ee9a87eb')
package() {
	tar -xvf data.tar.xz -C ${pkgdir}
	rm ${pkgdir}/usr/bin/steamlinkdeps
	install -D -m0644 ../56-steamlink.rules ${pkgdir}/usr/lib/udev/rules.d/56-steamlink.rules
	install -D -m0644 ../uinput.conf ${pkgdir}/etc/modules-load.d/uinput.conf
}
