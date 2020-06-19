# Maintainer: PurpleUltraViolet <purple.ultraviolet616@gmail.com>

pkgname=ftops-git
pkgver=v1.0.6
pkgrel=1
pkgdesc="Fountain markup to PostScript"
arch=('i686' 'x86_64')
url="https://github.com/PurpleUltraViolet/ftops"
license=('MIT')
depends=('python')
makedepends=('git')
source=('ftops-git::git+https://github.com/PurpleUltraViolet/ftops.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    :
}

package() {
    local bin=$pkgdir/usr/bin/ftops
	cd "$srcdir/$pkgname"
    mkdir -p $pkgdir/usr/bin
    echo "#!/usr/bin/env python3" > $bin
    cat ftops.py >> $bin
    chmod a+x $bin
}
