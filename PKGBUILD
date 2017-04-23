# Maintainer: Eric Lehmann <katyl@katyl.info>
# Co-Maintainer: Thomas Fanninger <thomas@fanninger.at>
# Contributor: ultraviolet <ultravioletnanokitty@gmail.com>
# MAintainer: Pablo Lezeta <prflr88@gmail.com>

pkgname=iio-sensor-proxy
pkgver=2.2
pkgrel=3
pkgdesc="IIO accelerometer sensor to input device proxy"
arch=("i686" "x86_64")
url="https://github.com/hadess/iio-sensor-proxy"
license=("GPLv2")
depends=("systemd" "libgudev" "gtk3")
makedepends=("git" "gtk-doc" "gnome-common")
source=("${pkgname}::https://github.com/hadess/iio-sensor-proxy/releases/download/${pkgver}/iio-sensor-proxy-${pkgver}.tar.xz")
sha512sums=('3d273f51b106302f4a194ebd5a6397b899b708dc197f4e9801b87c9f49732ff8bf4fe60cb8aad8eec9336987c7721de7a0cdb1bdf061b29fd057d6e737bd6fd8')
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
