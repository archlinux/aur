# Maintainer: Caesim404 <caesim404 at gmail dot com>
# Contributor: Christopher Loen <christopherloen at gmail dot com>

pkgname=cloudget
pkgver=0.72
pkgrel=1
pkgdesc="Python script to bypass cloudflare from command line"
arch=(any)
url="https://github.com/eudemonics/cloudget"
license=(unknown)
depends=(python2-beautifulsoup4 python2-cfscrape)
source=("https://raw.githubusercontent.com/Caesim404/cloudget/master/cloudget.py")
sha256sums=("620a4640b87015016694861e7df23b59ff4f5482c0835d02db402a4b687015c7")

prepare() {
     cd "${srcdir}"
     
     sed -i '1c\#!/usr/bin/env python2' cloudget.py
}

package() {
	cd "${srcdir}"
	
	install -Dm755 cloudget.py "${pkgdir}/usr/bin/cloudget"
}
