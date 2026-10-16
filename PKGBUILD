# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>
# Maintainer: Marc Straube <email@marcstraube.de>

pkgname=mercure
pkgver=1.1.2
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
            '275641115660b44b7622ff8fa2e1483ad1c489ce1282a6e72649f62d76e3f1dd77d7a84b3940884191636912388a6815267930b46511d3517ad492e37f5a4bc1'
            '4136caa1b1b89d0fd07462d3a4dcea17901f19b5bd5397ec7ed566fb9b8a598f428ca71f6612830e693263fdd9eeabd3695cdba1f5cc2d549c7cc9a388b060c5')
sha512sums_x86_64=('3c7ab3cb17d5409f4bebaaeafd7624bff169b86b3ac4a3c4b1733ae43eb71301e1d28c4422caf687781472d9f332a88080c94a1ded758b8508fb58c7f05e6591')

package(){
  install -Dm 755 mercure "${pkgdir}"/usr/bin/mercure
  install -Dm 755 mercure.service "${pkgdir}"/usr/lib/systemd/system/mercure.service
  install -Dm 644 mercure.sysusers "${pkgdir}"/usr/lib/sysusers.d/mercure.conf
  install -Dm 644 mercure.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/mercure.conf
  install -Dm 644 Caddyfile "${pkgdir}"/etc/mercure/Caddyfile
  install -Dm 644 dev.Caddyfile "${pkgdir}"/etc/mercure/dev.Caddyfile
}
