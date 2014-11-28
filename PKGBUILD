# Contributor: Jaroslav Lichtblau <tu@dragonlord.cz>

pkgname=lmarbles
pkgver=1.0.7
pkgrel=4
pkgdesc="An Atomix clone with a slight change in concept."
url="http://lgames.sourceforge.net/index.php?project=LMarbles"
license=('GPL')
arch=('i686' 'x86_64')
depends=('sdl_mixer')
source=(http://downloads.sourceforge.net/sourceforge/lgames/$pkgname-$pkgver.tar.gz)

md5sums=('b29156bc5021877d080e5e268012f4ec')

build() {
  cd "${srcdir}/$pkgname-$pkgver"

  ./configure --prefix=/usr --localstatedir=/var
  make || return 1
  make DESTDIR=${pkgdir} install
}
