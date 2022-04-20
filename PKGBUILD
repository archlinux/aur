# Maintainer: Xyem <xyem@electricjungle.org>
pkgname=sheepit-client-systemd
pkgver=0.0.0
pkgrel=1
pkgdesc="Systemd service for SheepIt client"
arch=('any')
license=('GPL2')
depends=('sheepit-client-bin')
conflicts=('sheepit-client-git')
backup=('etc/conf.d/sheepit-client')
source=(
  'sheepit-client.sysusers'
  'sheepit-client.tmpfiles'
  'sheepit-client.conf'
  'sheepit-client.service'
)
sha256sums=(
  '9f79eb4c182e4c2b9da1a7a26724e6122e25b958615b3001c2708fb0243f7f11'
  'ba7e49757345d04ae42a8a86fcee3ff53eb9fc86ef8a5b3db8895b5e4b42440a'
  '543e6e050fcadae27e646a4f6cd654b893035c47f89f14cf04ed0f6c25bd0d61'
  '42c9f6802ddeea2a2b9c8438e8c395689f4634c664fb04d7be7ecf30a9022f6c'
)

package() {
  install -Dm644 "${pkgname%-systemd}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname%-systemd}.conf";
  install -Dm644 "${pkgname%-systemd}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname%-systemd}.conf"
  install -Dm644 "${pkgname%-systemd}.conf" "${pkgdir}/etc/conf.d/${pkgname%-systemd}"
  install -Dm644 "${pkgname%-systemd}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname%-systemd}.service"
}
