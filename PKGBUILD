# Maintainer: PenguinSnail

pkgname=quick-back-git
pkgver=r4.914774a
pkgrel=1
pkgdesc="Quick, simple command line backup tool"
arch=('any')
url="https://github.com/PenguinSnail/Quick-Back"
license=('GPL3')
depends=('rsync')
makedepends=('git') 
provides=('quick-back')
conflicts=('quick-back')
options=()
source=('git://github.com/PenguinSnail/Quick-Back')
md5sums=('SKIP')

_gitname='Quick-Back'

pkgver() {
    cd $srcdir/$_gitname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir $pkgdir/usr
    mkdir $pkgdir/usr/bin
    cd $srcdir/$_gitname
    cp quick-back $pkgdir/usr/bin
    chmod +x $pkgdir/usr/bin/quick-back
}

