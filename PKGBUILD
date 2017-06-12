# Maintainer: coco
# Co-Maintainer: thatgeek
pkgname=torguard
pkgver=0.3.69
pkgrel=1
pkgdesc="TorGuard VPN Software
 Stay private online with TorGuard's anonymous VPN software and connect to 37+ countries worldwide."
arch=('x86_64')
url="www.torguard.com"
depends=('iproute2')
license=(custom)
source=(code_x64_${pkgver}.tar.gz::http://updates.torguard.biz/Software/Linux/torguard-v0.3.69-amd64.tar.gz)
md5sums=('179cb7c1716740a2cedb66e0c0f1c02f')

package() {

        mkdir -p "$pkgdir/opt/${pkgname}"
        cp -r "${srcdir}/${pkgname}-v0.3.69-amd64/"* "${pkgdir}/opt/${pkgname}" -R
        find "$pkgdir"/opt/torguard/ -type f -exec chmod 644 {} \;
        find "$pkgdir"/opt/torguard/ -name torguard -exec chmod 755 {} \;
        find "$pkgdir"/opt/torguard/ -name torguard-wrapper -exec chmod 755 {} \;
        find "$pkgdir"/opt/torguard/ -name ss-local -exec chmod 755 {} \;
        find "$pkgdir"/opt/torguard/ -name openvpn  -exec chmod 755 {} \;
        find "$pkgdir"/opt/torguard/ -name openconnect  -exec chmod 755 {} \;
        find "$pkgdir"/opt/torguard/ -name vpnc-script  -exec chmod 755 {} \;

        install -d "$pkgdir"/usr/bin/
        ln -s /opt/torguard/bin/torguard-wrapper "$pkgdir"/usr/bin/torguard
}
