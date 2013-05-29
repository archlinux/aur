# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>
# Contributor: Ray Griffin <rorgoroth@googlemail.com>

# Based on the coverlovin PKGBUILD
pkgname=coverlovin-funk
_pkgname=coverlovin
pkgver=2.0
pkgrel=1
pkgdesc="CLI recursive directory album art downloader written in Python, Thomas Funk patches"
arch=('any')
url="https://launchpad.net/coverlovin"
license=('GPL3')
depends=('python2' 'python2-simplejson' 'mutagen')
provides=('coverlovin')
conflicts=('coverlovin')
replaces=('coverlovin')
source=("https://launchpadlibrarian.net/135960815/coverlovin.py")
md5sums=('6a49c643142816a78069f72ae35ed565')

prepare(){
	cd ${srcdir}
	sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' ${_pkgname}.py
}

package(){
	cd ${srcdir}
	mkdir -p ${pkgdir}/usr/bin
	install -Dm755 ${_pkgname}.py ${pkgdir}/usr/bin/${_pkgname}
}
