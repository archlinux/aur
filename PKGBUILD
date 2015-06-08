# Maintainer : Jo De Boeck <deboeck.jo@gmail.com>

pkgname=purple-skypeweb-git
pkgver=0.0.1.r2.g2e79de7
pkgrel=2
arch=('any')
license=('GPLv3')
pkgdesc="SkypeWeb Plugin for Pidgin"
url="https://github.com/EionRobb/skype4pidgin/tree/master/skypeweb"
depends=('libpurple' 'json-glib')

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
    install -D -m 644 "$srcdir/$pkgname/skypeweb/libskypeweb.so" "$pkgdir/usr/lib/purple-2/libskypeweb.so"
}
