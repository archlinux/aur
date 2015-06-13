# Maintainer: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: mickael9 <mickael9 at gamil dot com>

pkgname=rott
pkgver=1.1.2
pkgrel=1
pkgdesc='A high quality first-person perspective 3D action game'
arch=('i686' 'x86_64')
license=('GPL')
depends=('sdl_mixer')
url="http://icculus.org/rott/"
source=(http://icculus.org/rott/releases/$pkgname-$pkgver.tar.gz)
md5sums=('d523c7c6c97f95ba84b8cf4deae7db38')

build() {
  cd $pkgname-$pkgver/rott
  make SHAREWARE=0 SUPERROTT=1
}

package() {
  cd $pkgname-$pkgver/rott
  install -Dm755 rott $pkgdir/usr/bin/rott
  install -Dm644 ../doc/rott.6 $pkgdir/usr/share/man/man6/rott.6
}
