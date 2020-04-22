# Maintainer: Jan Holthuis <holthuis.jan@googlemail.com>

pkgname=calibre-server-systemd
pkgver=1.0
pkgrel=1
pkgdesc="Systemd service for calibre-server"
url="https://github.com/kovidgoyal/calibre"
arch=('any')
depends=('calibre')
license=('GPL')
source=('calibre-server.service'
        'calibre-server.tmpfiles'
        'calibre-server.sysusers')

sha256sums=('4d043544c00969a9c70ab603ef202384b2134974499fcbcb6c804b150a47af25'
            'a436a979ca3a9e78bdc410bd0027d97956bfa8d2d4f2b7bdf3f7d2ed199dd6a8'
            '435d956100b7474133ec58764d7e9d8d641fbac0e623952769e9817d7187025d')

package() {
  install -D -m 644 "${srcdir}/calibre-server.sysusers" "${pkgdir}/usr/lib/sysusers.d/calibre-server.conf"
  install -D -m 644 "${srcdir}/calibre-server.service" "${pkgdir}/usr/lib/systemd/system/calibre-server.service"
  install -D -m 644 "${srcdir}/calibre-server.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/calibre-server.conf"
}
