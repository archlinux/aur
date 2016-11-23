# Maintainer: PenguinSnail

pkgname=quick-back-git
pkgver=r15.2459656
pkgrel=1
pkgdesc="Quick, simple command line backup tool"
arch=('any')
url="https://github.com/PenguinSnail/Quick-Back"
license=('GPL3')
depends=('rsync')
makedepends=('git')
optdepends=('arch-install-scripts: Repair backed-up fstab *experimental')
provides=('quick-back-git')
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
    install -D -m 755 $srcdir/$_gitname/quick-back $pkgdir/usr/bin/quick-back
}

