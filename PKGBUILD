# Maintainer: ABOhiccups <https://twitter.com/ABOhiccups>
pkgname=torguard-git
pkgver=4.8.17
pkgrel=1
pkgdesc="TorGuard VPN Software
 Stay private online with TorGuard's anonymous VPN software and connect to 37+ countries worldwide."
arch=('x86_64')
url="www.torguard.com"
depends=('iproute2' 'psmisc' 'libxkbcommon-x11')
license=(custom)
source=("https://updates.torguard.biz/Software/Linux/torguard-v${pkgver}-amd64-arch.tar.gz")
md5sums=("SKIP")
install=torguard.install

package() {
        cp -r "$srcdir"/*/* "$pkgdir"
        find "$pkgdir"/opt/torguard/ -type f -exec chmod 644 {} \;
        find "$pkgdir"/opt/torguard/ -name torguard -exec chmod 755 {} \;
        find "$pkgdir"/opt/torguard/ -name torguard-wrapper -exec chmod 755 {} \;
        find "$pkgdir"/opt/torguard/ -name ss-local -exec chmod 755 {} \;
        find "$pkgdir"/opt/torguard/ -name openvpn -exec chmod 755 {} \;
        find "$pkgdir"/opt/torguard/ -name openconnect -exec chmod 755 {} \;
        find "$pkgdir"/opt/torguard/ -name vpnc-script -exec chmod 755 {} \;
        find "$pkgdir"/opt/torguard/ -name stunnel_5_42 -exec chmod 755 {} \;
        find "$pkgdir"/opt/torguard/ -name stunnel_5_57 -exec chmod 755 {} \;
        find "$pkgdir"/opt/torguard/bin/ -name torguard-startup.desktop -exec chmod 664 {} \;
        find "$pkgdir"/etc/sudoers.d/ -name torguard -exec chmod 440 {} \;

        install -d "$pkgdir"/usr/bin/
        ln -s /opt/torguard/bin/torguard-wrapper "$pkgdir"/usr/bin/torguard
}
