# Maintainer: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgname=exiso-git
pkgver=2.7.0.r29.7a83e3c
pkgrel=1
pkgdesc="An xdvdfs .iso (xbox iso) file extraction and creation tool."
arch=('i686' 'x86_64')
url="https://github.com/Intline9/i360gm.git"
license=('custom')
makedepends=('git')
source=('git://github.com/Intline9/i360gm.git')
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/i360gm/dep/exiso"

    echo "$(find . -name 'released_version_is_*' | cut -d '_' -f 4).$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")"
}

build() {
    cd "$srcdir/i360gm/dep/exiso"

    make
}

package() {
    install -Dm755 "$srcdir/i360gm/dep/exiso/extract-xiso" "$pkgdir/usr/bin/exiso"
}
