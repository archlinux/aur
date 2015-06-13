# Maintainer: Rikard Falkeborn <rikard.falkeborn@gmail.com>
pkgname=cpu-monitor-extension-lxpanel-plugin
pkgver=1.5
pkgrel=1
pkgdesc="Adds memory and swap usage to the default cpu usage monitor plugin in lxde panel."
arch=('i686' 'x86_64')
url="https://github.com/danamlund/cpu-monitor-extension-lxpanel-plugin"
license=('GPL2')
groups=(lxde)
depends=('lxpanel')
source=("https://github.com/danamlund/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('babca791069c502b977264c2aa0e6f94')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/lib/lxpanel/plugins"
  make DESTDIR="${pkgdir}" install
}

