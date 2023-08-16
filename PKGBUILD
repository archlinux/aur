# Maintainer: Riedler <dev@riedler.wien>
# Contributor: David Birks <david@tellus.space>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Alexander Bachler Jansson <alexander.bachler.jansson@gmail.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Simon Morgan <simon@16hz.net>

pkgname=nosefart
pkgver=3.3
pkgrel=0
pkgdesc='NES sound format (nsf) player'
arch=('x86_64' 'i686')
url='https://github.com/RiedleroD/nosefart'
depends=('sdl2')
license=('GPL2')
source=("nosefart-$pkgver.zip::https://github.com/RiedleroD/nosefart/archive/refs/tags/$pkgver.zip")
sha256sums=('3ac217c9f85bafc797fb2a584b8acf140507855db10e2dd6a6da1249da76fac3')
build() {
  cd "$pkgname-$pkgver"

  make WANT_DEBUG=FALSE
}

package() {
  cd "$pkgname-$pkgver"

  make PREFIX="$pkgdir/usr" install WANT_DEBUG=FALSE
}

# vim:set ts=2 sw=2 et:
