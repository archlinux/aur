# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=xmms-scrobbler
pkgver=0.4.0
pkgrel=1
pkgdesc="Audioscrobbler plugin for XMMS"
arch=('i686' 'x86_64')
url="http://xmms-scrobbler.sommitrealweird.co.uk/"
license=('GPL')
depends=('xmms' 'musicbrainz' 'taglib' 'curl')
source=(http://xmms-scrobbler.sommitrealweird.co.uk/download/$pkgname-$pkgver.tar.gz)
md5sums=('a50de221dfb2cd87d803d22655df3dad')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr --disable-bmp-plugin
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
