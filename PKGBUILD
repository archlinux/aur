# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname="pidgin-pushbullet-git"
pkgver="r33.38040a1"
pkgrel="2"
pkgdesc="Lets you (currently) send/receive SMS from your Android phone to/from Pidgin."
arch=("i686" "x86_64")
url="https://github.com/EionRobb/pidgin-pushbullet"
license=("GPL")
depends=("libpurple")
source=("git+https://github.com/EionRobb/pidgin-pushbullet.git")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
}
