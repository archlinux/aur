# Maintainer: Yassine Oudjana <y.oudjana@protonmail.com>

pkgname=derelict-util
_ver=3.0.0-beta.2
pkgver=${_ver//-/_}
pkgrel=1
pkgdesc="Cross-platform shared library loader and a number of utility modules used by the Derelict libraries."
arch=('x86_64')
url="https://github.com/DerelictOrg/DerelictUtil"
license=('Boost')
makedepends=('dub')
source=("https://github.com/DerelictOrg/DerelictUtil/archive/refs/tags/v$_ver.tar.gz")
sha256sums=('d6407725cc202121f56382df62e0997b4067dd05ccda7b387cef5dcddbd6c3c4')

build() {
	cd DerelictUtil-$_ver

	dub build
}

package() {
	cd DerelictUtil-$_ver

	install -Dm0755 -t "$pkgdir/usr/lib/" "lib/libDerelictUtil.a"
	mkdir -p "$pkgdir/usr/include/d/derelict/util"
	cp -R --no-dereference --preserve=mode,links "source/derelict/util" "$pkgdir/usr/include/d/derelict/"
}

