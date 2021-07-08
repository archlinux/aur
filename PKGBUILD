# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Justin Gottula <justin@jgottula.com>

pkgname=wsdd
pkgver=0.6.4
pkgrel=1
pkgdesc="A Web Service Discovery (WSD) host daemon for SMB/Samba."
arch=('any')
url="https://github.com/christgau/wsdd"
license=('MIT')

depends=('samba')

source=("wsdd-${pkgver}.tar.gz::https://github.com/christgau/wsdd/archive/v${pkgver}.tar.gz"
        'wsdd.service')

sha256sums=('bb8bc6411b70be68369c53bf75827ac77f16a5bf5606de6536dd7e6d6ce4c2be'
            '5408872bb509fc130de00099407c7eef6c68b7913b54649970e8e3a2f54f4316')

package() {
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}/src/wsdd.py" "${pkgdir}/usr/bin/wsdd"
  install -D -m 644 "${srcdir}/wsdd.service" "${pkgdir}/usr/lib/systemd/system/wsdd.service"
}
