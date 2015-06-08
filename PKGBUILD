# Maintainer: wicast <wicastchen at hotmail.com>

pkgname='danmaku2ass-native'
pkgver=b2def5f
pkgrel=2
epoch=
pkgdesc="Convert comments from bilibili to ASS format ( cpp version )"
arch=('i686' 'x86_64')
url="http://blog.eqoe.cn/posts/danmaku2ass_native.html"
license=('WTFPL')
groups=()
depends=('')
depends_x86_64=('gcc-libs-multilib')
makedepends=('git' 'cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git://github.com/typcn/danmaku2ass_native.git")
noextract=()
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
	cd "$srcdir/$pkgname"
	cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" .
	make
}

package() {
	cd "$srcdir/$pkgname"
        install -Dm=775 danmaku2ass_native "${pkgdir}/usr/bin/danmaku2ass-native"
        install -Dm=775 libdanmaku2ass.so "${pkgdir}/usr/lib/libdanmaku2ass.so"
        install -Dm=775 danmaku2ass.h "${pkgdir}/usr/include/danmaku2ass.h"
}
