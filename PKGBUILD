# Maintainer : Jo De Boeck <deboeck.jo@gmail.com>

pkgname=purple-skypeweb-git
pkgver=0.0.1.r8.g9dcb0c112b94050603b6e46c19a6fa0c2ddd61d5
pkgrel=8
arch=(x86_64 i686)
license=('GPLv3')
pkgdesc="SkypeWeb Plugin for Pidgin"
url="https://github.com/EionRobb/skype4pidgin/tree/master/skypeweb"
depends=('libpurple' 'json-glib')
makedepends=('pkg-config')

source=("$pkgname"::'git://github.com/EionRobb/skype4pidgin')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname/skypeweb"
    make
}

package() {
    cd "$srcdir/$pkgname/skypeweb"
    make DESTDIR="$pkgdir" install
}
