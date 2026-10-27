# Maintainer: agony <27015 at riseup dot net>

pkgname=centrifugo-bin
pkgver=6.10.2
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
sha256sums_x86_64=('fea3767686d2bcc55df02094cc323268d9a02bb255eb60884d9e74ce4162eb45')
sha256sums_aarch64=('5bfaf520235db64ea1339247f4d6b14c0738979fedae187c57aa24c1861db5c2')
sha256sums_armv6h=('b871244ef64e159f956e4bbc417a16e145d6ed84682cd36125ce1f3682d89cf3')

package() {
  install -Dm755 centrifugo -t "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/etc/centrifugo"
  install -Dm644 centrifugo.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 centrifugo.sysusers "${pkgdir}/usr/lib/sysusers.d/centrifugo.conf"
  install -Dm644 centrifugo.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/centrifugo.conf"
}
