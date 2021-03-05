# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=sakura-frp
pkgver=0.35.1_sakura_2.1
pkgrel=1
pkgdesc="Sakura Frp"
arch=('x86_64' 'i686' 'aarch64' 'armv6h' 'armv7h' 'arm')
url="https://www.natfrp.com/"
license=('custom')
provides=('sakura-frpc' 'natfrp')
source=(LICENSE::'https://www.natfrp.com/policy/'
        "${pkgname}c.service"
        "${pkgname}c@.service"
        "${pkgname}c-f@.service")
backup=("etc/${pkgname}/frpc.ini")
source_x86_64=(${pkgname}-${pkgver}-x86_64::"https://azure.globalslb.net/frp/${pkgver//_/-}/frpc_linux_amd64")
source_i686=(${pkgname}-${pkgver}-i686::"https://azure.globalslb.net/frp/${pkgver//_/-}/frpc_linux_386")
source_arm=(${pkgname}-${pkgver}-arm::"https://azure.globalslb.net/frp/${pkgver//_/-}/frpc_linux_arm")
source_armv7h=(${pkgname}-${pkgver}-arm::"https://azure.globalslb.net/frp/${pkgver//_/-}/frpc_linux_arm")
source_armv6h=(${pkgname}-${pkgver}-arm::"https://azure.globalslb.net/frp/${pkgver//_/-}/frpc_linux_arm")
source_aarch64=(${pkgname}-${pkgver}-aarch64::"https://azure.globalslb.net/frp/${pkgver//_/-}/frpc_linux_arm64")
md5sums=('SKIP'
         '4fb2a7fdc3abaa441385e7598d60362a'
         'f0a1b91d07a50785b2500b16c730bf9a'
         '37b14750055c7c04ce7c3e80fa3894d3')
md5sums_x86_64=('9892b70acbb15c3802ebb833203630bc')
md5sums_i686=('6063859c1067a8cfda2de355c3029793')
md5sums_aarch64=('a84d974eac06638dcf03e1d5f21eda74')
md5sums_armv6h=('eb829c7b7d9a45e1466e389033d32c49')
md5sums_armv7h=('eb829c7b7d9a45e1466e389033d32c49')
md5sums_arm=('eb829c7b7d9a45e1466e389033d32c49')

package() {
  install -Dm755 ${pkgname}-${pkgver}-* ${pkgdir}/usr/bin/${pkgname}c

  # frpc.ini
  install -dm755 ${pkgdir}/etc/${pkgname}
  touch ${pkgdir}/etc/${pkgname}/frpc.ini

  # systemd service
  install -Dm644 ${pkgname}c.service -t ${pkgdir}/usr/lib/systemd/system/
  install -Dm644 ${pkgname}c@.service -t ${pkgdir}/usr/lib/systemd/system/
  install -Dm644 ${pkgname}c-f@.service -t ${pkgdir}/usr/lib/systemd/system/

  # LICENSE
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}
}

# vim: set sw=2 ts=2 et:
