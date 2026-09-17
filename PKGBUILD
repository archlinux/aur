# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>
# Maintainer: Marc Straube <email@marcstraube.de>

pkgname=mercure
pkgver=1.0.0
pkgrel=1
pkgdesc='Server-sent live updates: protocol and reference implementation'
arch=('x86_64')
url='https://mercure.rocks'
license=('AGPL-3.0-only')
backup=('etc/mercure/Caddyfile' 'etc/mercure/dev.Caddyfile')

source=('mercure.service' 'mercure.sysusers' 'mercure.tmpfiles' 'Caddyfile' 'dev.Caddyfile')
source_x86_64=("mercure-${pkgver}_x86_64::https://github.com/dunglas/mercure/releases/download/v${pkgver}/mercure_Linux_x86_64.tar.gz")

sha512sums=('c6b650f7cb4a59197170f0675585eae04d235f5a52eba3d232813d7e4b8bc5a3be0c56bcf6a9e133b81e32e139991dfc54bdc0a85b8d9e16718bdf40b7c01394'
            '9dd5104f850e8aca3b420de6ac407e42fd32bde145d9ac9d47fa00e101a4f5f64136b745bb467ea8b250099bc80ae84baf1fa46b972cdc37a61aa5057c02ad67'
            '68236e714ba954332f4ee2a9f558795cfcdfd32d2162fa5f369a1d0f38d8524c23199f1b14df39670d001a769bb460f1431caa84dec108f37129ead5d3d04391'
            '281cd46241e13860154a29eff8ba72d7f403abbbf9bfd82d1015bd5c044d10e281646944669f236c9d0505fe33ce9587f0d873c5b944654cc5f7f56ed1a1eb9c'
            '06d058afb68d4cb083e4a13e8c626c22eece913f14db9c68b9d2528cddc683a4081dcd2e2a9e3e90374c0cd207b66f190129749f46552649129bd20f96a1c124')
sha512sums_x86_64=('67211ed9e53f7de55b6e6663fed465592f32acc55ff9caf877468e3ac2e45232d78a0a72fd10e002c5280b71ad8bfd5d13f6a2b60737a92744439309469593b7')

package(){
  install -Dm 755 mercure "${pkgdir}"/usr/bin/mercure
  install -Dm 755 mercure.service "${pkgdir}"/usr/lib/systemd/system/mercure.service
  install -Dm 644 mercure.sysusers "${pkgdir}"/usr/lib/sysusers.d/mercure.conf
  install -Dm 644 mercure.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/mercure.conf
  install -Dm 644 Caddyfile "${pkgdir}"/etc/mercure/Caddyfile
  install -Dm 644 dev.Caddyfile "${pkgdir}"/etc/mercure/dev.Caddyfile
}
