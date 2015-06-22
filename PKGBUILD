pkgname="mcabber-module-external-editor"
pkgver=13.7eabded
pkgdesc="Write multiline messages in mcabber using editor"
pkgrel=1
url="https://github.com/kovetskiy/mcabber-external-editor"
arch=('any')
license=('GPL')
makedepends=()
source=("git://github.com/kovetskiy/mcabber-external-editor")
md5sums=('SKIP')

pkgver() {
    cd "mcabber-external-editor"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    cd "$srcdir/mcabber-external-editor"

    cmake .
    make
}

package() {
    mkdir -p "$pkgdir/usr/lib/mcabber/"
    cp -a "$srcdir/mcabber-external-editor/libeditor.so" "$pkgdir/usr/lib/mcabber/"
}
