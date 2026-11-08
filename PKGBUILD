# Maintainer: agony <27015 at riseup dot net>

pkgname=centrifugo-bin
pkgver=6.10.3
pkgrel=1
pkgdesc='Scalable real-time messaging server (prebuilt)'
arch=('x86_64' 'aarch64' 'armv6h')
url='https://github.com/centrifugal/centrifugo'
license=('Apache-2.0')
provides=("centrifugo=${pkgver}")
conflicts=('centrifugo')
install=centrifugo.install
_release="${url}/releases/download/v${pkgver}"
source=('centrifugo.service'
        'centrifugo.sysusers'
        'centrifugo.tmpfiles')
source_x86_64=("${_release}/centrifugo_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_release}/centrifugo_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("${_release}/centrifugo_${pkgver}_linux_armv6.tar.gz")
sha256sums=('f61eeb35bfa248be947b0da434bf82815d2a0396f10933e4aadac06a73462f9c'
            'dd656417db47b6dd5260a8a6b1f82005c80b6555ac65dd375a95e3aa5168e728'
            '3a4a5123db7293dc103187f406a168214ced95bda0c4f6c0f06508cf262a9718')
sha256sums_x86_64=('780bfd4d1266746c3a8bbc66d2ffe66d7bac8917bfa9218b46c83771a1e669d5')
sha256sums_aarch64=('d332630f8aeaf045845206ab74061c77ee0ac8746d788743959c59764ca22071')
sha256sums_armv6h=('ec97aba676579bec2a0c97662ca55333ccc247d248020bf5c4452cfe128dd9da')

package() {
  install -Dm755 centrifugo -t "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/etc/centrifugo"
  install -Dm644 centrifugo.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 centrifugo.sysusers "${pkgdir}/usr/lib/sysusers.d/centrifugo.conf"
  install -Dm644 centrifugo.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/centrifugo.conf"
}
