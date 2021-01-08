# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=sakura-frp
pkgver=0.34.2_sakura_3.1          
pkgrel=3
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
md5sums=('c3675dc7b62fa2493991798745068042'
         '4fb2a7fdc3abaa441385e7598d60362a'
         'f0a1b91d07a50785b2500b16c730bf9a'
         '37b14750055c7c04ce7c3e80fa3894d3')
md5sums_x86_64=('6ec3dff64f6424bd06171ba1fb07dcd3')
md5sums_i686=('86582226f7311f1539bde3e5fc4299f5')
md5sums_aarch64=('0c3346d149d9f2d1a7331f0a3cf07863')
md5sums_armv6h=('ec9be36a2b88649bc48a44fc0bdaf130')
md5sums_armv7h=('ec9be36a2b88649bc48a44fc0bdaf130')
md5sums_arm=('ec9be36a2b88649bc48a44fc0bdaf130')

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
