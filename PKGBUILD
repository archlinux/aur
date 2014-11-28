# Contributor: Jaroslav Lichtblau <tu@dragonlord.cz>

pkgname=eviltris
pkgver=0.7
pkgrel=1
pkgdesc="A tetris like game, but the 'random' order of piece selection is different than the standard 'random' number generator method."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/eviltris"
license=('GPL')
depends=('sdl' 'mesa')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('d824425e19836dd2ae95c99268614d83')

build() {
  cd "${srcdir}/$pkgname-$pkgver"

  make || return 1
  install -D -m755 "${srcdir}/$pkgname-$pkgver/$pkgname" "${pkgdir}/usr/bin/$pkgname" || return 1
}
