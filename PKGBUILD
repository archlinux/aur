# Contributor: Olivier Mehani <olivier.mehani@inria.fr>
# $Id$

_nylonpkgname=nylon-build-stable
_nylonpkgver=1.0
pkgname=nylon-patcher
pkgver=20040913
pkgrel=1
pkgdesc="Patching tool from Nylon"
url="http://www.meshcube.org"
depends=(python)
makedepends=(bitbake)
source=(http://meshcube.org/nylon/stable/$_nylonpkgname-$_nylonpkgver.tar.gz)
md5sums=('4f9edec77ee925b1e24a13c55f4dbb99')
provides=(patcher)

build() {
	export OEBASE=$startdir/src/$_nylonpkgname-$_nylonpkgver
	export BBPATH=${OEBASE}:${OEBASE}/openembedded
	export LANG=C
	cd $OEBASE
	bitbake -b openembedded/packages/patcher/patcher-native_20040913.bb
	install -D -m 0755 $startdir/src/$_nylonpkgname-$_nylonpkgver/tmp/staging/i686-linux/bin/patcher $startdir/pkg/usr/bin/patcher
}
