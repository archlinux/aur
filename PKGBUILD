# Maintainer: Giovanni Santini "ItachiSan" <giovannisantini93@yahoo.it>

pkgname=bzr-builder-bzr
_pluginname=bzr-builder
pkgver=0.7.4.1.r174
_pkgver=0.7.4 # Needed for pkgver() function
pkgrel=1
pkgdesc="A bzr plugin to construct a bzr branch based on a recipe. (Bazaar source code)"
url="https://launchpad.net/bzr-builder"
arch=('any')
license=("GPL3")
depends=('bzr' 'python2' 'python2-debian' 'devscripts' 'dput')
provides=('bzr-builder')
conflicts=('bzr-builder')
source=('bzr+lp:bzr-builder')
md5sums=('SKIP')

pkgver() {
	# Getting version
	cd "$srcdir/$_pluginname"
	echo "$_pkgver.$pkgrel.r$(bzr revno)"
}

package() {
	# Installing files
	cd "$srcdir/$_pluginname"
	mkdir -p "$pkgdir/usr/lib/python2.7/site-packages/bzrlib/plugins/builder"
	cp -rp . "$pkgdir/usr/lib/python2.7/site-packages/bzrlib/plugins/builder"
	# Remove Bazaar clone files
	rm "$pkgdir/usr/lib/python2.7/site-packages/bzrlib/plugins/builder/.bzrignore"
	rm -r "$pkgdir/usr/lib/python2.7/site-packages/bzrlib/plugins/builder/.bzr/"
}
