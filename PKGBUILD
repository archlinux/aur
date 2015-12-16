pkgname=skypeweb-git
pkgver=1.0.20151216.3af15e7
pkgrel=1
pkgdesc='SkypeWeb Plugin for Pidgin (development)'
arch=('any')
url='https://github.com/EionRobb/skype4pidgin/tree/master/skypeweb'
license=('GPL')
depends=('libpurple' 'json-glib')
makedepends=('git')
conflicts=('skypeweb')
provides=('skypeweb')
source=('git+https://github.com/EionRobb/skype4pidgin.git')
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd skype4pidgin/${pkgname%%-git}
  make
}

package() {
  cd skype4pidgin/${pkgname%%-git}
    make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
