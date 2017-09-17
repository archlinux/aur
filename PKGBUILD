# Maintainer: Federico Di Pierro <nierro92@gmail.com>

pkgname=trashd-git
_gitname=Trashd
pkgver=r58.a82039a
pkgrel=1
pkgdesc="Linux bus user service that provides an implementation of freedesktop trash spec"
arch=('i686' 'x86_64')
url="https://github.com/FedeDP/${_gitname}"
license=('GPL')
depends=('systemd')
makedepends=('git')
optdepends=('udisks2: to support external filesystems trash')
source=("git://github.com/FedeDP/${_gitname}.git")
sha256sums=("SKIP")

pkgver() {
    cd "$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/$_gitname
    make
}

package() {
    cd $srcdir/$_gitname
    make DESTDIR="$pkgdir" install
}
