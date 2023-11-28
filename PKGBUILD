# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>
# Maintainer: Marc Straube <email@marcstraube.de>

pkgname=mercure
pkgver=0.15.5
pkgrel=1
pkgdesc='Server-sent live updates: protocol and reference implementation'
arch=('x86_64')
url='https://mercure.rocks'
license=('AGPL3')
backup=('etc/mercure/Caddyfile' 'etc/mercure/Caddyfile.dev')

source=('mercure.service' 'mercure.sysusers' 'mercure.tmpfiles' 'Caddyfile' 'Caddyfile.dev')
source_x86_64=("mercure-${pkgver}_x86_64::https://github.com/dunglas/mercure/releases/download/v${pkgver}/mercure_Linux_x86_64.tar.gz")

sha512sums=('cdfcab53d5ae52395b10afe6fe9a2dbb6a1dddb6535773dde94c7f29aa05e316e714a7dddf9b4f345db6fa4226c83a17f2c7f7bd1300711100b8a712afb10324'
            '9dd5104f850e8aca3b420de6ac407e42fd32bde145d9ac9d47fa00e101a4f5f64136b745bb467ea8b250099bc80ae84baf1fa46b972cdc37a61aa5057c02ad67'
            '68236e714ba954332f4ee2a9f558795cfcdfd32d2162fa5f369a1d0f38d8524c23199f1b14df39670d001a769bb460f1431caa84dec108f37129ead5d3d04391'
            'f0a2e107a2d3977e037862a6b5a964c5051452040ae64ab997a3948b80e67c191672dca04703c83dfc4a866d782ecb83ae334dfe44553bc134553975fbd8dc8b'
            '66d5f99fe323ef91058d73d083ef6201b2129720dda36709b6a04789f4f0d08c8e959e27113668d09e07f012eb324cb5ec9a79724923329a8ca007800ab677e5')
sha512sums_x86_64=('750f13647554a3c1cd51c4b2d76023566d6970365daf176a4668565e7b0f19a1a6ea041440782f67d8a908f7d998d5e0c725a1cdb86c68a7411bff4a54c8ab7b')

package(){
  install -Dm 755 mercure "${pkgdir}"/usr/bin/mercure
  install -Dm 755 mercure.service "${pkgdir}"/usr/lib/systemd/system/mercure.service
  install -Dm 644 mercure.sysusers "${pkgdir}"/usr/lib/sysusers.d/mercure.conf
  install -Dm 644 mercure.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/mercure.conf
  install -Dm 644 ../Caddyfile "${pkgdir}"/etc/mercure/Caddyfile
  install -Dm 644 ../Caddyfile.dev "${pkgdir}"/etc/mercure/Caddyfile.dev
}
