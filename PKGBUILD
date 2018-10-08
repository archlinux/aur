# Maintainer: Nguyen Pham Cao <natsukagami at gmail dot com>

pkgname=cndrvcups-lt
pkgver=1.50
pkgrel=1
pkgdesc='Canon UFR II /LIPSLX Printer Driver for some LBP drivers'
arch=('x86_64')
url='https://www.canon-europe.com/support/consumer_products/products/printers/laser/i-sensys_lbp6030.aspx?type=drivers&language=EN&os=Linux%20(64-bit)'
depends=('libglade' 'gcc-libs' 'libxml2' 'libjpeg-turbo' 'libgcrypt' 'cndrvcups-common-lb')
source=("http://gdlp01.c-wss.com/gds/0/0100005950/09/linux-UFRIILT-drv-v150-uken.tar.gz")
md5sums=('002c076389a000d9b47fb3771532bf88')
install="$pkgname.install"

package() {
	# Concerning the 64 bit version only right now
	cd "${srcdir}/linux-UFRIILT-drv-v150-uken/64-bit_Driver/Debian"
	ar x cndrvcups-ufr2lt-uk_1.50-1_amd64.deb
	mkdir data
	tar -xzf data.tar.gz -C data
	cd data
	cp -r . "${pkgdir}"
}