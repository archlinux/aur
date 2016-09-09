# Contributer : Jo De Boeck <deboeck.jo@gmail.com>
# Maintainer : Colin Arnott <arnottcr@gmail.com>

pkgname=purple-skypeweb-git
pkgver=r942.f477d9e
pkgrel=1
arch=('any')
license=('GPLv3')
pkgdesc="SkypeWeb Plugin for Pidgin"
url="https://github.com/EionRobb/skype4pidgin/tree/master/skypeweb"
depends=('libpurple' 'json-glib')
makedepends=('pkg-config' 'git')
conflicts=('purple-skypeweb' 'skype4pidgin')
provides=('purple-skypeweb')

source=("$pkgname"::'git://github.com/EionRobb/skype4pidgin')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
    cd "$srcdir/$pkgname/skypeweb"
    make
}

package() {
    cd "$srcdir/$pkgname/skypeweb"
    make DESTDIR="$pkgdir" install
}
