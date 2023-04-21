# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Justin Gottula <justin@jgottula.com>

pkgname=wsdd
pkgver=0.7.1
pkgrel=1
pkgdesc="A Web Service Discovery (WSD) host daemon for SMB/Samba."
arch=('any')
url="https://github.com/christgau/wsdd"
license=('MIT')

depends=('python>=3.7' 'samba')

backup=('etc/conf.d/wsdd')

source=("wsdd-${pkgver}.tar.gz::https://github.com/christgau/wsdd/archive/v${pkgver}.tar.gz"
        'wsdd.service'
        'wsdd.conf')

sha256sums=('deb4e647c7dbcaace8a88100db83b9a80fa0f67b9490c04c76db2b142d4457a4'
            '8f4326841b5ba899752ba30554fcc5ea4b2353dadb951535fd62e234fb1f5009'
            '7330cfb5cabbc7f3116781baa0f92c8bb4ac86a20f22edef5c5d98997f253c08')

package() {
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}/src/wsdd.py" "${pkgdir}/usr/bin/wsdd"
  install -D -m 644 "${srcdir}/${pkgname}-${pkgver}/man/wsdd.8" "${pkgdir}/usr/share/man/man1/wsdd.8"
  install -D -m 644 "${srcdir}/wsdd.conf" "${pkgdir}/etc/conf.d/wsdd"
  install -D -m 644 "${srcdir}/wsdd.service" "${pkgdir}/usr/lib/systemd/system/wsdd.service"
}
