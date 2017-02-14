# Maintainer: Daniel Haß <aur@hass.onl>
pkgname=extra
pkgver=0.0.1
pkgrel=1
pkgdesc="Extra is a app which allows you to install elementary themes on your computer."
arch=('i686' 'x86_64')
url="https://git.enlightenment.org/apps/extra.git/about/"
license=('custom')
depends=('efl')
install="$pkgname.install"
source=("https://download.enlightenment.org/rel/apps/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('16b8bfd2eed180f56e5d24fcf9a1da3e')

build() {
  cd $pkgname-$pkgver

  ./autogen.sh --prefix=/usr/
  make all
}

package(){
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
