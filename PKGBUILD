# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=lmarbles
pkgver=1.0.8
pkgrel=1
pkgdesc="An Atomix clone with a slight change in concept"
arch=('i686' 'x86_64')
url="http://lgames.sourceforge.net/index.php?project=LMarbles"
license=('GPL')
depends=('sdl_mixer')
source=(http://downloads.sourceforge.net/sourceforge/lgames/$pkgname-$pkgver.tar.gz)
md5sums=('2735ef0cbf39ac79194321ff49e02f0e')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr --localstatedir=/var
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
