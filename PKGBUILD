# Contributor: Benoit Rouits <brouits@free.fr>
# Maintainer: John "ShaggyTwoDope" Jenkins <twodopeshaggy at gmail dot com>
pkgname=sido
pkgver=0.13
pkgrel=2
pkgdesc="a mini MPD client for the systray"
arch=('i686' 'x86_64')
url="https://dbx.gtmp.org/svn/sido/"
license=('GPL')
depends=('gtk2' 'glib2')
makedepends=('make' 'gcc' 'pkgconfig')
source=(http://brouits.free.fr/fala/releases/$pkgname-$pkgver.tar.gz)
md5sums=('09248b74d94b8af635fa115068d6daef')
noextract=()

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make PREFIX=/usr || return 1
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
