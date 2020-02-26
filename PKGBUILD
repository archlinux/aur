# Maintainer: Kalani Helekunihi <i [at] am [dot] guru>

pkgname=xteve
pkgver=2.1.2
pkgrel=1
pkgdesc="IPTV Proxy for Plex DVR"
arch=('x86_64' 'aarch64')
url="https://xteve.de"
license=('MIT')
source=("${pkgname}.service"
	"${pkgname}.sysusers"
	"${pkgname}.tmpfiles")
source_x86_64=('https://xteve.de/download/xteve_2_linux_amd64.zip')
source_aarch64=('https://xteve.de/download/xteve_2_linux_arm64.zip')

md5sums=('d7f09bca696e34173dcc3fa4dba81650'
         '8ad3c1b952d0b4a722439c60c8f6ceec'
         '7991e718cab0bf566f22f499c720b325')
md5sums_x86_64=('2910fac6f39f471513be693ef52c2228')
md5sums_aarch64=('e5194e71791be007ad590bea3d5eb096')

package() {
	install -Dm755 ${srcdir}/xteve $pkgdir/usr/bin/${pkgname}
	install -Dm0644 ${srcdir}/${pkgname}.sysusers ${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf
	install -Dm0644 ${srcdir}/${pkgname}.service $pkgdir/usr/lib/systemd/system/${pkgname}.service
	install -Dm0644 ${srcdir}/${pkgname}.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf
}

