pkgname=torguard
pkgver=0.3.59
pkgrel=1
pkgdesc="TorGuard VPN Software
 Stay private online with TorGuard's anonymous VPN software and connect to 37+ countries worldwide."
arch=('x86_64')
url="www.torguard.com"
depends=('iproute2')
license=(custom)
source=(code_x64_${pkgver}.tar.gz::http://updates.torguard.biz/Software/Linux/torguard-v0.3.59-amd64.tar.gz)
md5sums=('afd93670483381dbd5b565823022147c')

package() {

        mkdir -p "$pkgdir/opt/${pkgname}"
        cp -r "${srcdir}/${pkgname}-v0.3.59-amd64/"* "${pkgdir}/opt/${pkgname}" -R
        find "$pkgdir" -type f -exec chmod 644 {} \;
        find "$pkgdir" -name torguard -exec chmod 755 {} \;
        find "$pkgdir" -name torguard-wrapper -exec chmod 755 {} \;
        find "$pkgdir" -name ss-local -exec chmod 755 {} \;
        find "$pkgdir" -name openvpn  -exec chmod 755 {} \;

        install -d "$pkgdir"/usr/bin/
        ln -s /opt/torguard/bin/torguard-wrapper "$pkgdir"/usr/bin/torguard
}
