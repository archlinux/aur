# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Rikard Falkeborn <rikard.falkeborn at gmail dot com>

pkgname=sensors-lxpanel-plugin
pkgver=1.8
pkgrel=1
pkgdesc="Monitor temperature/voltages/fan speeds in LXDE through lm-sensors."
arch=('i686' 'x86_64')
url="http://danamlund.dk/sensors_lxpanel_plugin"
license=('GPL2')
groups=(lxde)
depends=('lm_sensors' 'lxpanel')
source=("https://github.com/danamlund/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a921b5ad472f69c6e0534ba916b0bee0089b34571e438b4ccb5de576f9001fb8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/lib/lxpanel/plugins"
  make DESTDIR="${pkgdir}" install
}
