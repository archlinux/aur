# Maintainer: João Figueiredo <islandc0der@chaotic.cx>
# Contributor: Sapphira Armageddos <shadowkyogre.public@gmail.com>

pkgname=icebreaker
pkgver=2.2.1
pkgrel=1
pkgdesc="A clone of Jezzball that uses icebergs and penguins. (non-theme support version)"
arch=(i686 x86_64)
url="https://mattdm.org/icebreaker/"
license=(GPL)
depends=(sdl_mixer)
source=("https://mattdm.org/$pkgname/${pkgver%.*}.x/$pkgname-$pkgver.tar.xz")
sha256sums=('29d02d59681faa1e83949b7bae4553720db0247c51ac040bb9f3b516350e9810')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make highscoredir=/var/lib/games prefix=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir/usr" install "highscoredir=$pkgdir/var/lib/games"
}
