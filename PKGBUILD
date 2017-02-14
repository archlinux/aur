pkgname=torguard
pkgver=0.3.62
pkgrel=1
pkgdesc="TorGuard VPN Software
 Stay private online with TorGuard's anonymous VPN software and connect to 37+ countries worldwide."
arch=('x86_64')
url="www.torguard.com"
depends=('iproute2')
license=(custom)
source=(code_x64_${pkgver}.tar.gz::http://updates.torguard.biz/Software/Linux/torguard-v0.3.62-amd64.tar.gz)
md5sums=('9411604cc16e9b9ab79c6fd46df00241')

package() {

        mkdir -p "$pkgdir/opt/${pkgname}"
        cp -r "${srcdir}/${pkgname}-v0.3.62-amd64/"* "${pkgdir}/opt/${pkgname}" -R
        find "$pkgdir" -type f -exec chmod 644 {} \;
        find "$pkgdir" -name torguard -exec chmod 755 {} \;
        find "$pkgdir" -name torguard-wrapper -exec chmod 755 {} \;
        find "$pkgdir" -name ss-local -exec chmod 755 {} \;
        find "$pkgdir" -name openvpn  -exec chmod 755 {} \;

        install -d "$pkgdir"/usr/bin/
        ln -s /opt/torguard/bin/torguard "$pkgdir"/usr/bin/torguard
}
