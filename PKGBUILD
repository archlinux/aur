# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>
# Contributor: Ray Griffin <rorgoroth@googlemail.com>

# Based on the coverlovin PKGBUILD
pkgname=coverlovin-funk
_pkgname=coverlovin
pkgver=20130603
pkgrel=1
pkgdesc="CLI recursive directory album art downloader written in Python, Thomas Funk patches"
url="https://launchpad.net/coverlovin"
arch=('any')
license=('GPL3')
depends=('python2' 'python2-simplejson' 'mutagen')
provides=('coverlovin')
conflicts=('coverlovin')
replaces=('coverlovin')
source=('https://launchpadlibrarian.net/141574171/coverlovin.py')
md5sums=('2206e9f4f394cca8735669b3b75240d7')

prepare(){
	cd ${srcdir}
	sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' ${_pkgname}.py
}

package(){
	cd ${srcdir}
	mkdir -p ${pkgdir}/usr/bin
	install -Dm755 ${_pkgname}.py ${pkgdir}/usr/bin/${_pkgname}
}
