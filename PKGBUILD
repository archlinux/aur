# Maintainer: Thayne McCombs <bytecurry.software@gmail.com>
pkgname=roswell
pkgver="21.10.14.111"
pkgrel=1
pkgdesc="Lisp installer and launcher"
url="https://github.com/roswell/roswell"
arch=('i686' 'x86_64')
license=('MIT')
depends=('curl')
optdepends=()
source=("https://github.com/roswell/roswell/archive/v$pkgver.tar.gz")
b2sums=('816f2fbbf99be21f7416456fb724faf5e290090ad2130bdd6feb03573cb059bf21bd5419cbf5928c84d2a977c123b31597df6676f65a11ded0121acc37c589aa')



build() {
  cd "$pkgname-$pkgver"
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D COPYING "$pkgdir/usr/share/licenses/roswell/LICENSE"
}
