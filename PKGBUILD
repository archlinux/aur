# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=sakura-frp
pkgver=0.34.2_sakura_2
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
source_x86_64=(${pkgname}-${pkgver}-x86_64::"https://getfrp.sh/d/frpc_linux_amd64")
source_i686=(${pkgname}-${pkgver}-i686::"https://getfrp.sh/d/frpc_linux_386")
source_arm=(${pkgname}-${pkgver}-arm::"https://getfrp.sh/d/frpc_linux_arm")
source_armv7h=(${pkgname}-${pkgver}-arm::"https://getfrp.sh/d/frpc_linux_arm")
source_armv6h=(${pkgname}-${pkgver}-arm::"https://getfrp.sh/d/frpc_linux_arm")
source_aarch64=(${pkgname}-${pkgver}-aarch64::"https://getfrp.sh/d/frpc_linux_arm64")
md5sums=('SKIP'
         '1407d25307cd98902f60db064f2e2bc0'
         'a87e9ee64c87ab609d1e978adc6446e0'
         'd3f3b3c8368fdc692a8a7d71bf9ae5c8')
md5sums_x86_64=('526097f74b626c3c6b7dabb2c4aa60e6')
md5sums_i686=('2dd86fcfc58b407eaee25b24ba6fab0a')
md5sums_aarch64=('84b7ce3114d3b903c6f7029bd5e9e42d')
md5sums_armv6h=('aa6252089728871e32e44f812134e594')
md5sums_armv7h=('aa6252089728871e32e44f812134e594')
md5sums_arm=('aa6252089728871e32e44f812134e594')

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
