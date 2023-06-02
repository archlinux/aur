# Maintainer: Yacob Zitouni <yacob.zitouni@gmail.com>
pkgname=('projectctr-makerom')
pkgver=0.18.3
pkgrel=1
pkgdesc="Creates CTR cxi/cfa/cci/cia files"
arch=('x86_64')
url="https://github.com/3DSGuy/Project_CTR/"
license=('unknown')
sha256sums=('SKIP')

_gitname=projectctr
source=("$_gitname::git+https://github.com/3DSGuy/Project_CTR.git#tag=makerom-v$pkgver")

build() {
    cd "$srcdir/$_gitname/makerom"
    make deps
    make
}

package() {
    install -D "$srcdir/$_gitname/makerom/bin/makerom" "$pkgdir/usr/bin/makerom"
}
