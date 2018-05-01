# Maintainer: Daniel Haß <aur@hass.onl>
pkgname=extra
pkgver=0.0.1
pkgrel=2
pkgdesc="Extra is a app which allows you to install elementary themes on your computer."
arch=('i686' 'x86_64')
url="https://git.enlightenment.org/apps/extra.git/about/"
license=('custom')
depends=('efl')
install="$pkgname.install"
source=("https://download.enlightenment.org/rel/apps/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('1f4cbe597c0c61536a81410309443e29f2a54f3df1ab63de4cbb38c15de51632')

build() {
  cd $pkgname-$pkgver

  ./autogen.sh --prefix=/usr/
  make all
}

package(){
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
