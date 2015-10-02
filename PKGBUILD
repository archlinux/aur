# Maintainer: Yegor Alexeyev <yegor.alexeyev@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Constantinko <helllamer@gmail.com>

pkgname=pixel_keyboard_backlight_driver
pkgver=0.1.5
pkgrel=4
pkgdesc='Chromebook Pixel keyboard backlight kernel driver'
arch=('i686' 'x86_64')
url='https://github.com/xhcnb/pixel_keyboard_backlight_driver'
license=('GPL')
source=('git://github.com/xhcnb/pixel_keyboard_backlight_driver.git')
md5sums=('SKIP')

build() {
  cd ${srcdir}/${pkgname}
  make CFLAGS=-DKB_BACKLIGHT=1
}


package() {
	mkdir -p ${pkgdir}/usr/lib/modules/extramodules-4.2-ARCH

	install -D -m0755 ${srcdir}/${pkgname}/pixel_kb_backlight.ko ${pkgdir}/usr/lib/modules/extramodules-4.2-ARCH/
  
  #it is configured to be build as backlight(look at make CFLAGS parameter) 
	#install -D -m0755 ${srcdir}/$pkgname}/chromeos_keyboard_bl.ko ${pkgdir}/usr/lib/modules/extramodules-4.2-ARCH/
}

