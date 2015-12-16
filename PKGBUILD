pkgname=purple-skypeweb
_pkgname=skypeweb
_parentname=skype4pidgin
pkgver=1.0
pkgrel=1
arch=('any')
license=('GPLv3')
pkgdesc="SkypeWeb Plugin for Pidgin"
url="https://github.com/EionRobb/skype4pidgin/tree/master/skypeweb"
depends=('libpurple' 'json-glib')
makedepends=('pkg-config')

source=("$pkgname"::"https://github.com/EionRobb/$_parentname/archive/v$pkgver.tar.gz")
sha512sums=('324d1832b3dcb7c7ff3039bd455da8ea0128b30b1778d98bb6fb90ea7b9aaf4f59711c8ed5480f96fd2c75dc7ca1c3033d9b957438289d5815a09881723ff761')

build() {
    cd "$srcdir/$_parentname-$pkgver/$_pkgname"
    make
}

package() {
    cd "$srcdir/$_parentname-$pkgver/$_pkgname"
    make DESTDIR="$pkgdir" install
}
