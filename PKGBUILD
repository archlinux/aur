# Maintainer: Ernie Brodeur <ebrodeur@ujami.net>
# Originally this was the junglediskdesktop PKG.  I have modified it to download and install the server management software.

pkgname=junglediskserver
pkgver=3.20.0
_downloadver=${pkgver//./}
pkgrel=2
pkgdesc="Online backup and storage powered by Amazon S3™ and Rackspace.  This is the server daemon only."
arch=("x86_64")
url="http://www.jungledisk.com/"
license=("custom")
depends=('fuse2')
source=('junglediskserver.service')
source_x86_64=("https://downloads.jungledisk.com/jungledisk/${pkgname}64-${_downloadver}.tar.gz")
md5sums=('38cae2f4491fb54dbc936a5029d280c2')
md5sums_x86_64=("4b5a98e2531a3988a8f2f8f99103aa94")

package() {
	cp -r "${srcdir}/jungledisk-serverbackend-${pkgver}-linux-${CARCH}"/* "$pkgdir/"
	install -D -m644 junglediskserver.service "$pkgdir/usr/lib/systemd/system/junglediskserver.service"
}
