# Maintainer: Michal Bozon <mxlbzn at gmail dot com>
pkgname=drawterm-9front-hg
pkgver=r326.fac7facfeaa8
pkgrel=1
pkgdesc="Drawterm fork by 9front project."
arch=('i686' 'x86_64')
url="http://drawterm.9front.org/"
license=('custom')
depends=('xorg-server')
makedepends=('make' 'gcc' 'mercurial')
conflicts=('drawterm-git' 'drawterm-hg')
source=("$pkgname::hg+https://code.9front.org/hg/drawterm")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
	cd "$srcdir/$pkgname"
	CONF=unix make
}

package() {
	cd "$srcdir/$pkgname"
        install -Dm755 drawterm $pkgdir/usr/bin/drawterm
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
