# Contributor: ultraviolet <ultravioletnanokitty@gmail.com>
# MAintainer: Pablo Lezeta <prflr88@gmail.com>

pkgname=iio-sensor-proxy
pkgver=1.0
pkgrel=1
pkgdesc="IIO accelerometer sensor to input device proxy"
arch=("i686" "x86_64")
url="https://github.com/hadess/iio-sensor-proxy"
license=("GPLv2")
depends=("systemd" "libgudev")
makedepends=("git" "gtk-doc" "gnome-common")
source=("${pkgname}::git+https://github.com/hadess/iio-sensor-proxy.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr \
  	--sysconfdir=/etc \
  	--bindir=/usr/bin \
  	--sbindir=/usr/bin \
  	--libdir=/usr/lib \
  	--libexecdir=/usr/lib
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="${pkgdir}" install
}
