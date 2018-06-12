# Maintainer: Ernie Brodeur <ebrodeur@ujami.net>
# Originally this was the junglediskdesktop PKG.  I have modified it to download and install the server management software.

pkgname=junglediskserver
pkgver=3.23.0
_downloadver=${pkgver//./}
pkgrel=1
pkgdesc="Online backup and storage powered by Amazon S3™ and Rackspace.  This is the server daemon only."
arch=("x86_64")
url="http://www.jungledisk.com/"
license=("custom")
depends=('fuse2')
source=('junglediskserver.service')
source_x86_64=("https://downloads.jungledisk.com/jungledisk/${pkgname}64-${_downloadver}.tar.gz")
sha256sums=(e3e41a8c84093b932f50d48826317581ecfdd09fb9ee3006f9d942ca04ab88df)
sha256sums_x86_64=(26e155421e8c5ff36dd7dddab2f000d9f7ce07c852c647987f550081eee05373)

package() {
	cp -r "${srcdir}/jungledisk-serverbackend-${pkgver}-linux-${CARCH}"/* "$pkgdir/"
	install -D -m644 junglediskserver.service "$pkgdir/usr/lib/systemd/system/junglediskserver.service"
}
