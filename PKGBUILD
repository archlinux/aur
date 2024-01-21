# Maintainer: wansing <mail at wansing dot org>
pkgname=traggo-bin
pkgver=0.3.0
pkgrel=3
pkgdesc="self-hosted tag-based time tracking"
arch=('x86_64')
url="https://github.com/traggo/server"
license=('GPL')
depends=('glibc' 'sqlite')
backup=('etc/traggo/server.ini')
source=(
	"${url}/releases/download/v${pkgver}/traggo-server-${pkgver}-linux-amd64.zip"
	"server.ini"
	"traggo.service"
	"traggo.sysusers"
	"traggo.tmpfiles"
)

sha256sums=('bde681e8aa60327799c2078649d8646e1d3c1c9d35d34430fd52ce04e419106c'
            'b6eeb163ecee75c7a956c3819c82abc049f3671f78941ee1166d366fd84641b0'
            '9553563de83ea251af917f9b20a8083296641ae9289aab4755f464e020764f32'
            '149b7165c6b6a2d47a3b124bafcc216b34248326c356ff59c05112afed14c90b'
            '9a2ef73c7c151b15b2ec04962ca8a3b37e99aaa9311ed6c165409245d506a557')

package() {
  install -Dm755 traggo-server-${pkgver}-linux-amd64 "$pkgdir"/usr/bin/traggo-server
  install -Dm644 "server.ini"      "${pkgdir}/etc/traggo/server.ini"
  install -Dm644 "traggo.service"  "${pkgdir}/usr/lib/systemd/system/traggo.service"
  install -Dm644 "traggo.sysusers" "${pkgdir}/usr/lib/sysusers.d/traggo.conf"
  install -Dm644 "traggo.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/traggo.conf"
}
