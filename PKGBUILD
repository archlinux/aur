# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=oczclout
pkgver=4.00.00.551
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

source=("http://ocz.com/enterprise/download/firmware/clout_v${pkgver//./_}_linux.tar.gz")
md5sums=('021fa23f32362c8de6354311eb31b346')
sha512sums=('375e2381c3a738bcecb61988a456de2c19d16349e3fa70e0d4eff97ff49b17005157af9b35b85f2ca020cc2ea2a3c38a22187a26f505aa6583d55b41d0f9e116')

package() {
  install -D -m755 "${srcdir}/clout_v${pkgver//./_}_linux/linux${_bits}/clout" "${pkgdir}/usr/bin/clout"
  install -D -m644 "${srcdir}/clout_v${pkgver//./_}_linux/linux${_bits}/README.txt" "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
  install -D -m644 "${srcdir}/clout_v${pkgver//./_}_linux/EULA.rtf" "${pkgdir}/usr/share/licenses/${pkgname}/EULA.rtf"
}
