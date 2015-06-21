# Maintainer: Jan Holthuis <holthuis.jan@googlemail.com>

pkgname=nzbget-systemd
pkgver=0.1
pkgrel=2
pkgdesc="Systemd service and config for NZBGet"
url="https://github.com/Holzhaus/PKGBUILDs"
arch=('any')
depends=('nzbget')
license=('GPL')
source=('nzbget.conf'
        'nzbget.service')
install='nzbget.install'
sha256sums=('50bf12ffeda5bca2327ee4665de000892d18514a13e445d78ff5dec78bd48c4f'
            'c5dc750214105fe2ab4aff9545a48b7a5cfa246d00c771b1600ce4e6b74f70fb')
package() {
  cd "${srcdir}"

  install -d "${pkgdir}/etc/systemd/system"
  install -m644 -t "${pkgdir}/etc/systemd/system" nzbget.service

  install -d "${pkgdir}/var/lib/nzbget"
  install -d "${pkgdir}/etc"
  install -m664 -t "${pkgdir}/etc" "${srcdir}/nzbget.conf"

  install -d "${pkgdir}/var/lib/nzbget/downloads"
  install -d "${pkgdir}/var/lib/nzbget/downloads/dst"
  install -d "${pkgdir}/var/lib/nzbget/downloads/inter"
  install -d "${pkgdir}/var/lib/nzbget/downloads/nzb"
  install -d "${pkgdir}/var/lib/nzbget/downloads/queue"
  install -d "${pkgdir}/var/lib/nzbget/downloads/tmp"
  install -d "${pkgdir}/var/lib/nzbget/downloads/scripts"


}
