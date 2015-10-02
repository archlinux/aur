# Maintainer: Yegor Alexeyev <yegor.alexeyev@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Constantinko <helllamer@gmail.com>

pkgname=isl29018_driver
pkgver=0.1.5
pkgrel=4
pkgdesc='Intersil ISL29018 sensor kernel driver(light sensor in Chromebook Pixel)'
arch=('i686' 'x86_64')
url='https://github.com/torvalds/linux/blob/master/drivers/staging/iio/light/isl29018.c'
license=('GPL')


build() {
  cd ${startdir}
  make 
}


package() {
	mkdir -p ${pkgdir}/usr/lib/modules/extramodules-4.2-ARCH

	install -D -m0755 ${startdir}/isl29018.ko ${pkgdir}/usr/lib/modules/extramodules-4.2-ARCH/

}

