# Maintainer: Iru Cai < vimacs.hacks at gmail dot com >

pkgname=gdanmaku-server
pkgver=1.0
pkgrel=1
pkgdesc='Web-based danmaku server'
arch=('any')
url='https://github.com/tuna/gdanmaku-server'
license=('GPL3')
backup=('etc/gdanmaku-server/settings.py')
depends=('python2-flask-babel' 'python2-gevent' 'python2-redis')
source=("https://github.com/tuna/gdanmaku-server/archive/v${pkgver}.tar.gz")
sha256sums=('45a8a1cf9f8dd1bb6a5d09bbf7fc9308c676ab59ba00fefa099385c917a885fa')

build() {
	true
}

package() {
	install -d "${pkgdir}/opt/${pkgname}" \
		"${pkgdir}/usr/bin" "${pkgdir}/etc/gdanmaku-server"
	
	cd "${srcdir}/${pkgname}-${pkgver}"
	cp -a gdanmaku webserver.py "${pkgdir}/opt/${pkgname}/"
	mv "${pkgdir}/opt/${pkgname}/gdanmaku/settings.py" "${pkgdir}/etc/gdanmaku-server/"
	ln -s "/opt/${pkgname}/webserver.py" "${pkgdir}/usr/bin/gdanmaku-server"
	ln -s /etc/gdanmaku-server/settings.py "${pkgdir}/opt/${pkgname}/gdanmaku/settings.py"
}
