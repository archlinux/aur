# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname='cloudget'
pkgver='0.72'
pkgrel=1
pkgdesc='A python script to bypass cloudflare from command line built upon cfscrape module'
arch=('x86_64')
url='https://github.com/eudemonics/cloudget'
license=('unknown')
depends=('python2' 'python2-beautifulsoup4' 'python2-cfscrape')
source=('https://raw.githubusercontent.com/eudemonics/cloudget/master/cloudget.py')
sha256sums=('c3d00412b9217d81deb9d35b56d02abec5566ad3489c0cbde85567a4be133a53')

prepare() {
     cd "${srcdir}"
     sed -i '1c\#!/usr/bin/env python2' cloudget.py
}

package() {
	 cd "${srcdir}"
	 install -dm755 "${pkgdir}/usr/bin" && cp cloudget.py "${pkgdir}/usr/bin/${pkgname}"
	 chmod +x "${pkgdir}/usr/bin/${pkgname}"
}
