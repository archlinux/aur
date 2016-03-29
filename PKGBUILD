# Maintainer: Yuexuan Gu <lastavengers@outlook.com>

pkgname=srain-git
pkgver=0.139.ef91eb7
pkgrel=1
pkgdesc="it does not look like a irc client"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/LastAvenger/srain"
depends=('gtk3' 'glib2' 'python')
makedepends=('git' 'make' 'gcc' 'pkg-config' 'gettext' 'curl')
conflicts=('srain')
provides=('srain')
source=("git+https://github.com/LastAvenger/srain.git")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname%-git}
    echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
    cd ${pkgname%-git}
    make init
    make DESTDIR="$pkgdir/usr"
}

package() {
    cd ${pkgname%-git}

    make DESTDIR="$pkgdir/usr" install
}
