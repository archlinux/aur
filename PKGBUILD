# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>
# Contributor: Ray Griffin <rorgoroth@googlemail.com>

pkgname=coverlovin
pkgver=2.0
pkgrel=1
pkgdesc="CLI recursive directory album art downloader written in Python"
arch=('any')
url="https://launchpad.net/coverlovin"
license=('GPL3')
depends=('python2' 'python2-simplejson')
provides=('coverlovin')
conflicts=('coverlovin-funk')
replaces=('coverlovin')
source=("https://launchpad.net/coverlovin/trunk/${pkgver}/+download/CoverLovin-${pkgver}.tar.gz")
md5sums=('0d02649097e05fde2da4a157c65e8720')

prepare(){
	cd ${srcdir}/${pkgname}
	sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' ${pkgname}.py
}

package(){
	cd ${srcdir}/${pkgname}
	mkdir -p ${pkgdir}/usr/share/coverlovin ${pkgdir}/usr/bin
	install -Dm755 *.py ${pkgdir}/usr/share/${pkgname}/
	mkdir -p ${pkgdir}/usr/bin
	ln -s "../../usr/share/${pkgname}/${pkgname}.py" "${pkgdir}/usr/bin/coverlovin"
}
