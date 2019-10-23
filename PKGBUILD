# Maintainer: jackus <jackusm95@gmail.com>

pkgname=easytether-bin
pkgver=0.8.9
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
	armv6h) _pkgarch="arm"
		sha256sums+=('835bece8494fce7f5ceca5b45023b9188a0868ef4ebe0fc9063f9cf2dac36241')
		;;
	armv6h) _pkgarch="armv6"
		sha256sums+=('eaea92e4810b1f024b512b224085e34050b27aafd99e5323a22b07f2e38f6f59')
		;;
	armv7h) _pkgarch="armv7"
		sha256sums+=('edc6cb840e816fa04445d73bd9100a4b94a73ff8b3d698a3cafe0ab254aefc3b')
		;;
	i686) _pkgarch="i386"
		sha256sums+=('81867d75fa974afa9100da8c94aef350e2892fd79b65fd92ae2308b15da3d83b')
		;;
	x86_64) _pkgarch="amd64"
		sha256sums+=('a576590d185a08384b3c7b856d66bfafb8e1a1b94c96f5f3bda96d9216d83cf9')
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


