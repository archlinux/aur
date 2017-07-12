# Maintainer: jackusm <jackusm95@gmail.com>

pkgname=easytether-bin
pkgver=0.8.8
pkgrel=1
pkgdesc="Internet access via smartphone"
arch=('i686' 'x86_64')
url=http://www.mobile-stream.com/easytether/drivers.html
license=(unknown:freeware)
depends=(glibc libusb udev)
conflicts=('easytether-rpm')
_file=easytether-${pkgver}-${pkgrel}-$CARCH.pkg.tar.xz
source=("http://www.mobile-stream.com/beta/arch/easytether-${pkgver}-${pkgrel}-$CARCH.pkg.tar.xz")
changelog=CHANGELOG
case "$CARCH" in
	armv6h) _pkgarch="armv6"
			sha256sums+=('f918fc5ed31811fb0390ebdfb50afd59795e3f82503813aa6d5c4279f7dcf89b')
			;;
	armv7h) _pkgarch="armv7"
			sha256sums+=('0bc017027a8bf3c2efafd8597532b53b2c40791d61c8a9c9c6c8641bf0e84add')
			;;
	i686) _pkgarch="386"
			sha256sums+=('a3f50f42cbfa24833d5c686edb3841912fc46b304947f046e59ec5cd7b77409d')
			;;
	x86_64) _pkgarch="amd64"
			sha256sums+=('392b01904aa37eb2d497f3bef459cc467f25466ed60247d596d9577e2a9b4008')
			;;
esac

build()
{
  cd ${srcdir}
  bsdtar -xf "${_file}"
}

package()
{
  cd ${srcdir}
  install -Dm755 ./usr/bin/easytether-usb ${pkgdir}/usr/bin/easytether-usb
  install -Ddm755 ${pkgdir}/var/lib/easytether/empty
}


