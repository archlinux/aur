# Maintainer: jackusm <jackusm95@gmail.com>

pkgname=easytether-bin
pkgver=0.8.5
pkgrel=2
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
			sha256sums+=('cb43bdceb98e06160ecc851475e9499f2ebdfe248cf64cc6516e6d71fc5efc8c')
			;;
	armv7h) _pkgarch="armv7"
			sha256sums+=('cee3948b867fdc21caccf3db9d2c6b896a935ec5f5ff4aa0db375894f6cd0409')
			;;
	i686) _pkgarch="386"
			sha256sums+=('26e7b27391fe9b83e83865c6343f56795606e55b5efb412a593dd6d16d9a6f7c')
			;;
	x86_64) _pkgarch="amd64"
			sha256sums+=('fbfda985cea4ba5f56a971132a8155d02f0986ad0629887f1e0075b39f58cbb0')
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


