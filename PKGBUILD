# Maintainer:  Paragoumba <paragoumba@protonmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Kaio Augusto <kaioaugusto.8@gmail.com>
# Contributor: Kyle <kyle@free2.ml>
# Contributor: mib1982 <Mi.Bentlage@gmail.com>
# Contributor: z3ntu <luca.emanuel.weiss@gmail.com>

pkgname='f3'
pkgver=9.0
pkgrel=1
pkgdesc='Simple tool that tests flash cards capacity and performance to see if they live up to claimed specifications'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/AltraMayor/f3'
license=('GPL3')
depends=('parted')
makedepends=('systemd')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('569ec069dc3ec1c74d90d6704aa8b7f45240f5998a9dc6f14f1736c917506ecb')

build() {
  make -C "${pkgname}-${pkgver}" {,extra}
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' -C "${pkgname}-${pkgver}" install{,-extra}
  install -Dvm644 "${pkgname}-${pkgver}/README.rst" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
