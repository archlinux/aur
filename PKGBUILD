# Maintainer: Kalani Helekunihi <i [at] am [dot] guru>

pkgname=xteve
pkgver=2.2
pkgrel=1
pkgdesc="IPTV Proxy for Plex DVR"
arch=('x86_64')
url="https://xteve.de"
license=('MIT')
source=("${pkgname}.service"
	"${pkgname}.sysusers"
	"${pkgname}.tmpfiles"
    "https://github.com/xteve-project/xTeVe-Downloads/raw/master/"$pkgname"_linux_amd64.tar.gz")
sha256sums=('931947d35b91d5763ba6218bdc9096b792d6e1718a9fca0a77b0ffb186c5ed36' 'dbf54529cec6663f89bdc5600df30e3328014096f61c3d43f3d8196556919ce3' '17bbf3c47404d3876f99c20ed2cc8787f8c4fea29717d18514d459af852825fb' '4fbe2999fe8fa80196060321eeabd76fda80aed713022769f0c2d45b20c0d107' )

package() {
	install -Dm755 ${srcdir}/xteve $pkgdir/usr/bin/${pkgname}
	install -Dm0644 ${srcdir}/${pkgname}.sysusers ${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf
	install -Dm0644 ${srcdir}/${pkgname}.service $pkgdir/usr/lib/systemd/system/${pkgname}.service
	install -Dm0644 ${srcdir}/${pkgname}.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf
}

