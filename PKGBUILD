# Maintainer : Claire Farron <diesal3@googlemail.com>
# Major Contributor : loqs (PKGBUILD, apt_pkg.patch)
# Contributor: Pedro Gabriel <pedrogabriel@dcc.ufmg.br>

pkgname=mintlocale
pkgver=1.3.1
pkgrel=1
pkgdesc="Locale selection for the Cinnamon Desktop"
arch=('any')
url="https://github.com/linuxmint/mintlocale"
license=('GPL2')
depends=('python2-gobject')
source=("http://packages.linuxmint.com/pool/main/m/mintlocale/mintlocale_$pkgver.tar.gz"
	"apt_pkg.patch")

sha256sums=('2124bcc023cccd13ff53a9ab50e177f2d5616224ac63edb6a348809bb3b491d9'
            'd18b6ae1a699b5a31436bbaf2a18d96d64a54e33a6d5daa1c60dfb0250f2dbc2')


prepare() {
	cd "$srcdir/$pkgname"
	find -type f -print0 | xargs -0 sed -i 's@^#!.*python$@#!/usr/bin/python2@'
	patch -p1 -i ../apt_pkg.patch
}

package() {
	cd "$srcdir/$pkgname"
	cp -r --no-preserve=owner usr $pkgdir
}
