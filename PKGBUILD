# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=wsdd
pkgver=0.4
pkgrel=1
pkgdesc="A Web Service Discovery (WSD) host daemon for SMB/Samba."
arch=('any')
url="https://github.com/christgau/wsdd"
license=('MIT')

depends=('samba')

source=("wsdd-${pkgver}.tar.gz::https://github.com/christgau/wsdd/archive/v${pkgver}.tar.gz"
        'wsdd.service'
        'wsdd.sysusers')

sha256sums=('dcc60b3c3ce077f6c48219ed5794f5bde7b7824f7fd674edb7d93e2acd2da623'
            '2f8f340dc5001df6fdb28482a4d27d7a17d1f0d2d1a130fdb882c445daa945c0'
            'b3d70334300cbd6c8ad3c0c9c910d09ba8bf98ff01b274bcda82d4973e4e1ac6')

package() {
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}/src/wsdd.py" "${pkgdir}/usr/bin/wsdd"
  install -D -m 644 "${srcdir}/wsdd.sysusers" "${pkgdir}/usr/lib/sysusers.d/wsdd.conf"
  install -D -m 644 "${srcdir}/wsdd.service" "${pkgdir}/usr/lib/systemd/system/wsdd.service"
}
