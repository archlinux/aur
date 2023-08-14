# Maintainer: Riedler <dev@riedler.wien>
# Contributor: David Birks <david@tellus.space>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Alexander Bachler Jansson <alexander.bachler.jansson@gmail.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Simon Morgan <simon@16hz.net>

pkgname=nosefart
pkgver=3.1
pkgrel=2
pkgdesc='NES sound format (nsf) player'
arch=('x86_64' 'i686')
url='https://github.com/RiedleroD/nosefart'
depends=('sdl2')
license=('GPL2')
source=("nosefart-$pkgver.zip::https://github.com/RiedleroD/nosefart/archive/refs/tags/$pkgver.zip")
sha256sums=('7d213e00bce6cc6d6f2ab2c57dee91b2bbf1a716a30b973bdebc47400a79a533')
build() {
  cd "$pkgname-$pkgver"

  make WANT_DEBUG=FALSE
}

package() {
  cd "$pkgname-$pkgver"

  make PREFIX="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
