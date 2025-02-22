# Contributor: Devin Hill lvlrk4u@proton.me

pkgname='fmon'
pkgver=1.4
pkgrel=3
pkgdesc="A quick, easy, and multi-threaded method to poll file modification."
arch=('x86_64')
url="https://github.com/lvlrk/fmon"
license=('GPL-3.0-or-later')
makedepends=('git')
source=("git+$url.git#commit=2946f3a0ebb7047445529d1017d1b32c5175da45")
sha256sums=('e1f567b234b81241a0ab9ab2124c8aeaf08fef6a723696944e625795e17da3a2')

build() {
    cd "$pkgname"
    make all lib
}

package() {
    cd "$pkgname"
    install -Dm755 fmon -t "$pkgdir/usr/bin"
    install -Dm755 include/fmon.h -t "$pkgdir/usr/include"
    install -Dm755 libfmon.so -t "$pkgdir/usr/lib"
}
