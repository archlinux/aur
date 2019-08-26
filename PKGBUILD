# Maintainer: Manuel Palenzuela <sadshinobi@protonmail.com>

author=troglobit
pkgname=sun-git
_gitname=sun
pkgver=0
pkgrel=1
pkgdesc='Simple library and application that shows sunset and sunrise based on your latitude,longitude'
url='https://github.com/troglobit/sun.git'
arch=('any')
license=('GPL')
depends=('autoconf' 'automake' 'libtool')
makedepends=('git')
conflicts=('sun')
provides=('sun')

source=("git://github.com/$author/$_gitname.git")

md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
    cd "$_gitname"
    printf '0.r%s.%s' \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_gitname"
    ./autogen.sh
    ./configure
}

package() {
    cd "$_gitname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
