# Maintainer: coco
# Co-Maintainer: thatgeek
pkgname=torguard
pkgver=0.3.81
pkgrel=1
pkgdesc="TorGuard VPN Software
 Stay private online with TorGuard's anonymous VPN software and connect to 37+ countries worldwide."
arch=('x86_64')
url="www.torguard.com"
depends=('iproute2')
license=(custom)
source=("https://updates.torguard.biz/Software/Linux/torguard-v0.3.81-amd64-arch.tar.gz")
md5sums=('bcb4b02548dc3b379da211d0559bc233')

package() {
	tar -xf "${srcdir}/${pkgname}-v${pkgver}-amd64-arch/torguard-v${pkgver}-amd64-arch.tar"
        cp -r "${srcdir}/${pkgname}-v${pkgver}-amd64-arch/opt" "${pkgdir}/" -R
        cp -r "${srcdir}/${pkgname}-v${pkgver}-amd64-arch/usr" "${pkgdir}/" -R
        find "$pkgdir"/opt/torguard/ -type f -exec chmod 644 {} \;
        find "$pkgdir"/opt/torguard/ -name torguard -exec chmod 755 {} \;
        find "$pkgdir"/opt/torguard/ -name torguard-wrapper -exec chmod 755 {} \;
        find "$pkgdir"/opt/torguard/ -name ss-local -exec chmod 755 {} \;
        find "$pkgdir"/opt/torguard/ -name openvpn_v2_3 -exec chmod 755 {} \;
        find "$pkgdir"/opt/torguard/ -name openvpn_v2_4 -exec chmod 755 {} \;
        find "$pkgdir"/opt/torguard/ -name openconnect -exec chmod 755 {} \;
        find "$pkgdir"/opt/torguard/ -name vpnc-script -exec chmod 755 {} \;
        find "$pkgdir"/opt/torguard/ -name stunnel -exec chmod 755 {} \;


        install -d "$pkgdir"/usr/bin/
        ln -s /opt/torguard/bin/torguard-wrapper "$pkgdir"/usr/bin/torguard
}
