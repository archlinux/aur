# Maintainer: Leon Möller <jkhsjdhjs@totally.rip>
pkgname=rtorrent-headless
pkgver=0.3
pkgrel=1
pkgdesc="Sysuser and systemd unit for headless rTorrent operation"
arch=('any')
license=('GPL')
depends=('rtorrent')
install='rtorrent-headless.install'
source=("rtorrent.sysusers"
        "rtorrent.tmpfiles"
        "rtorrent.service")
sha512sums=('fd0fcbe95ce477273c442686ec2b859c9c04538f078e882f784c42b44b205ce576a01ab2fbe59550266f306d8027470b68bdad8cf6518aa29412ecc0d99570d3'
            'f39f5fbb0a22ec77b0a9d3e6c584df269d8862a70695d9aa9e88e3c49ffd62baef35d9ffd5641cde1f74c2a0d60951892cfde58df1b8970813520ee987050a20'
            '3664652b0c93a9cf694b3c08b8faeb7ce940c9b2518b19933a4c6e36f5b35b85e1253c781c2d4863cc8b814fee505cd99e6caf1908149c832d4a4acb2b6e5697')

package() {
    cd "$srcdir"
    install -Dm644 "rtorrent.sysusers" "$pkgdir/usr/lib/sysusers.d/rtorrent.conf"
    install -Dm644 "rtorrent.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/rtorrent.conf"
    install -Dm644 "rtorrent.service" "$pkgdir/usr/lib/systemd/system/rtorrent.service"
}
