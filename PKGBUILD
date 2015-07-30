# Maintainer: Wang Jiajun <amesists AT gmail DOT com>
# Contributors: philacs

pkgname=115upload
pkgver=1.1.8
pkgrel=1
epoch=1
pkgdesc='115.com big file upload control'
url='http://115.com'
arch=('i686' 'x86_64')
license=('unknown')
depends=()

if [ "$CARCH" = "i686" ]; then
	source=("http://115.com/static/install/2014/${pkgname}_v${pkgver}_x86.tar.gz")
	md5sums=("7a3282809bb1c6389bbebf1e0d1aa9fe")
elif [ "$CARCH" = "x86_64" ]; then
	source=("http://115.com/static/install/2014/${pkgname}_v${pkgver}_x64.tar.gz")
	md5sums=("dfeb3eee82dcca468f297c31a1190b7a")
fi

package() {
	cd ${srcdir}
	if [ "$CARCH" = "i686" ]; then
		install -D -m644 ${srcdir}/115upload_plugin.so ${pkgdir}/usr/lib/mozilla/plugins/115upload_plugin.so
	elif [ "$CARCH" = "x86_64" ]; then
		install -D -m644 ${srcdir}/115upload_plugin.so ${pkgdir}/usr/lib/mozilla/plugins/115upload_plugin.so
	fi
}
