# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=wsdd
pkgver=0.3
pkgrel=1
pkgdesc="A Web Service Discovery (WSD) host daemon for SMB/Samba."
arch=('any')
url="https://github.com/christgau/wsdd"
license=('MIT')

depends=('samba')

source=("wsdd-${pkgver}.tar.gz::https://github.com/christgau/wsdd/archive/v${pkgver}.tar.gz"
        'wsdd.service'
        'wsdd.sysusers')

sha256sums=('f812284862b22e9135091fb991b664f44c2c7604294ef94be6503848244d4678'
            'bac5dd84891207bef919699646ae42d8523c28a607f7c7384afd42b3783de2a6'
            'b3d70334300cbd6c8ad3c0c9c910d09ba8bf98ff01b274bcda82d4973e4e1ac6')

package() {
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}/src/wsdd.py" "${pkgdir}/usr/bin/wsdd"
  install -D -m 644 "${srcdir}/wsdd.sysusers" "${pkgdir}/usr/lib/sysusers.d/wsdd.conf"
  install -D -m 644 "${srcdir}/wsdd.service" "${pkgdir}/usr/lib/systemd/system/wsdd.service"
}
