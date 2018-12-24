# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Tibor Bamhor <tiborb95 at gmail.com>

pkgname=dtboost
pkgver=1.6.15
pkgrel=2
pkgdesc="A daemon that changes priority (CPU and disk I/O) and limits CPU usage of your applications on the fly"
url="http://code.google.com/p/${pkgname}/"
license=("GPL3")
arch=("any")
depends=("python2")
optdepends=("cpulimit: CPU use limit per process")
install="${pkgname}.install"
backup=("etc/${pkgname}.conf")
source=(https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${pkgname}/${pkgname}-${pkgver}.tgz)

package() {
	cd ${srcdir}/${pkgname}

	# Directories
	install -d "${pkgdir}"/usr/{share/${pkgname}/,lib/systemd/system/} "${pkgdir}"/etc/

	install -m 744 ${srcdir}/${pkgname}/${pkgname}.py ${pkgdir}/usr/share/${pkgname}/
	install -m 644 ${srcdir}/${pkgname}/${pkgname}.conf ${pkgdir}/etc/
	#install -m 744 ${srcdir}/${pkgname}/${pkgname}.initscript ${pkgdir}/etc/rc.d/${pkgname}
	install -m 644 ${srcdir}/${pkgname}/${pkgname}.service ${pkgdir}/usr/lib/systemd/system/
}

sha1sums=('cb8e92515dde26f4cbe84f05ec0c86776dd5b46e')
