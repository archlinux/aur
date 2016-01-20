pkgname=purple-skypeweb
_pkgname=skypeweb
_parentname=skype4pidgin
pkgver=1.1
pkgrel=2
arch=('any')
license=('GPLv3')
pkgdesc="SkypeWeb Plugin for Pidgin"
url="https://github.com/EionRobb/skype4pidgin/tree/master/skypeweb"
depends=('libpurple' 'json-glib')
makedepends=('pkg-config')
conflicts=('skype4pidgin')

source=("$pkgname"::"https://github.com/EionRobb/$_parentname/archive/$pkgver.tar.gz")
sha512sums=('bf293ddfac8839c720e6a1e3c594d764d9a2ec876ed201dfcaf62c3f6eba4d6260dcd0bd06e8af60e2c61942396cad9ff76c7be3f5586927ae6ebcd2971d7280')

build() {
    cd "$srcdir/$_parentname-$pkgver/$_pkgname"
    make
}

package() {
    cd "$srcdir/$_parentname-$pkgver/$_pkgname"
    make DESTDIR="$pkgdir" install
}
