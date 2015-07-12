# Maintainer: Giovanni Santini "ItachiSan" <giovannisantini93@yahoo.it>

pkgname=bzr-builder-bzr
_pluginname=bzr-builder
pkgver=0.7.4.2.r174
_pkgver=0.7.4 # Needed for pkgver() function
pkgrel=2
pkgdesc="A bzr plugin to construct a bzr branch based on a recipe. (Bazaar source code)"
url="https://launchpad.net/bzr-builder"
arch=('any')
license=("GPL3")
depends=('python2' 'python2-debian' 'devscripts' 'dput')
makedepends('bzr')
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
