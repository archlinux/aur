# Maintainer: Rikard Falkeborn <rikard.falkeborn@gmail.com>
pkgname=sensors-lxpanel-plugin
pkgver=1.7
pkgrel=2
pkgdesc="Monitor temperature/voltages/fan speeds in LXDE through lm-sensors."
arch=('i686' 'x86_64')
url="http://danamlund.dk/sensors_lxpanel_plugin"
license=('GPL2')
groups=(lxde)
depends=('lm_sensors' 'lxpanel')
source=("http://s3.danamlund.dk.s3-website-us-east-1.amazonaws.com/sensors_lxpanel_plugin/${pkgname}-${pkgver}.tar.gz")
md5sums=('a39c8b0316b1d6e955ea8426acaa83de')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/lib/lxpanel/plugins"
  make DESTDIR="${pkgdir}" install
}
