# Maintainer: Eric Lehmann <katyl@katyl.info>
# Co-Maintainer: Thomas Fanninger <thomas@fanninger.at>
# Contributor: ultraviolet <ultravioletnanokitty@gmail.com>
# MAintainer: Pablo Lezeta <prflr88@gmail.com>

pkgname=iio-sensor-proxy
pkgver=2.4
pkgrel=3
pkgdesc="IIO accelerometer sensor to input device proxy"
arch=("i686" "x86_64")
url="https://github.com/hadess/iio-sensor-proxy"
license=("GPLv2")
depends=("systemd" "libgudev" "gtk3")
makedepends=("git" "gtk-doc" "gnome-common")
source=("${pkgname}::https://github.com/hadess/iio-sensor-proxy/releases/download/${pkgver}/iio-sensor-proxy-${pkgver}.tar.xz")
sha512sums=('d56316f4a606c7e453d5ede44cc31590cb9998dac31460037663bb75570fb221187c8b48e55f09263f3a461cd1f62b9066e3ec716636d1aabd635ff8e58955cd')
options=('!strip' '!emptydirs')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
  	--sysconfdir=/etc \
  	--bindir=/usr/bin \
  	--sbindir=/usr/bin \
  	--libdir=/usr/lib \
  	--libexecdir=/usr/lib
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
