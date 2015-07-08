# Maintainer: Amiad <amiadb at gmail dot com>

pkgname=geany-git
pkgver=1.24.1.919.gc5b8647
pkgrel=1
pkgdesc="Fast and lightweight IDE (git version)"
arch=('x86_64' 'i686')
url="http://github.com/geany/geany"
license=('GPL2')
depends=('gtk2' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('git' 'automake' 'autoconf' 'intltool')
conflicts=('geany')
provides=('geany')
source=("git://github.com/geany/geany.git")
md5sums=('SKIP')

_gitroot="geany"

pkgver () {
    cd "$srcdir/$_gitroot"
    git describe --always | sed 's|-|.|g'
}

build() {
    cd "$srcdir/$_gitroot"
    ./autogen.sh --prefix=/usr --disable-html-docs
    make
}

package() {
    cd "$srcdir/$_gitroot"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

