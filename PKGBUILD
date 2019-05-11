# Maintainer: Alberto Sánchez Molero <alsamolero@gmail.com>

_pkgname=mod_pagespeed
pkgname=$_pkgname-bin
pkgver=1.13.35.2
pkgdesc="Apache module for rewriting web pages to reduce latency and bandwidth."
pkgrel=1

arch=('x86_64')
url="https://www.modpagespeed.com/"
license=('Apache')
depends=('apache')
source=("https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-stable_current_amd64.deb")
sha256sums=('14de0b868f4da98bdfdf9cd8e2c12e3abc2a93029168ea27bfb3eb5ea158e3a5')


package() {
	tar -xC "$pkgdir" -f data.tar.gz
	mv "$pkgdir/usr/lib/apache2" "$pkgdir/usr/lib/httpd"
	mv "$pkgdir/etc/apache2" "$pkgdir/etc/httpd"
	rm -rf "$pkgdir/etc/cron.daily"
}


