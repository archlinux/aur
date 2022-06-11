# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=dvb-demod-si2165-fw
pkgver=6.0.119.31191
pkgrel=1
pkgdesc='Firmware file dvb-demod-si2165.fw for the Silicon Labs Si2165 DVB-T and DVB-C demodulator (si2165.ko kernel driver)'
arch=('any')
url='https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/scripts/get_dvb_firmware'
license=('custom')
makedepends=('linux-headers' 'unzip' 'wget')
source=('https://web.archive.org/web/20200515152229/https://www.hauppauge.de/files/drivers/model_111xxx_122xxx_driver_6_0_119_31191_WHQL.zip')
noextract=('model_111xxx_122xxx_driver_6_0_119_31191_WHQL.zip')
md5sums=('76633e7c76b0edee47c3ba18ded99336')
sha512sums=('30073358ea42b3c8b9b8c9611969d42c8b2070cfb4a27f2df358483ba148016e933a2eef15f6c9c97842ca74fd509103b78d4fc715e46e5459f97660d8ea12d5')

build() {
	_get_dvb_firmware=(/usr/lib/modules/*/build/scripts/get_dvb_firmware)
	"${_get_dvb_firmware[0]}" si2165
}

package() {
	install -Dm644 dvb-demod-si2165.fw -t "$pkgdir/usr/lib/firmware"
}
