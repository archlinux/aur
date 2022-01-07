# Maintainer: Riedler <dev@riedler.wien>
# Contributor: David Birks <david@tellus.space>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Alexander Bachler Jansson <alexander.bachler.jansson@gmail.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Simon Morgan <simon@16hz.net>

_gitver=388cb9602214ac9e28b064f4ebca31b47c096d4a
pkgname=nosefart
pkgver=3.0
pkgrel=1
pkgdesc='NES sound format (nsf) player'
arch=('x86_64' 'i686')
url='http://nosefart.sourceforge.net/'
depends=('sdl2')
license=('GPL2')
source=("https://github.com/misterhat/nosefart/archive/$_gitver.zip")
sha256sums=('82fd126cd10f432035ed920f2a2ed4b38b6b00533b7793ea2ce3253979031070')
build() {
  cd "$pkgname-$_gitver"

  make WANT_DEBUG=FALSE
}

package() {
  cd "$pkgname-$_gitver"

  make PREFIX="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
