# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=oczclout
pkgver=4.01.00.575
pkgrel=1
pkgdesc="A command line interface (CLI) based tool for managing OCZ’s enterprise SSD’s including firmware and BIOS updates."
arch=('i686' 'x86_64')
url="http://ocz.com/enterprise/download/firmware"
license=('custom')
if [ "$CARCH" == x86_64 ] ; then
  _bits=64
fi
if [ "$CARCH" == i686 ] ; then
  _bits=32
fi

source=("http://ocz.com/enterprise/download/clout/clout_v${pkgver//./_}_linux.tar.gz")
sha512sums=('c1b3c5d93d6ee9303bde79b086fde2fd0182dd9aa3ea0caad2c9096b7dff8019ba95048f3236fcc000fd69bad82c9e1132c543f6276c9c8d69b6f9ceec70d160')
md5sums=('d165c0528c9fdebc7eff7ef808d14487')

package() {
  install -D -m755 "${srcdir}/clout_v${pkgver//./_}_linux/linux${_bits}/clout" "${pkgdir}/usr/bin/clout"
  install -D -m644 "${srcdir}/clout_v${pkgver//./_}_linux/linux${_bits}/README.txt" "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
  install -D -m644 "${srcdir}/clout_v${pkgver//./_}_linux/EULA.rtf" "${pkgdir}/usr/share/licenses/${pkgname}/EULA.rtf"
}
