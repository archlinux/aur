# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
pkgname=rmixer
pkgver=1.3
pkgrel=1
pkgdesc="Simple remote interface for the ALSA mixer"
arch=('any')
url="https://github.com/maandree/rmixer"
license=('WTFPL')
depends=('java-runtime>=7' 'alsa-utils')
makedepends=('java-environment>=7' 'texinfo' 'gzip' 'auto-auto-complete')
provides=('rmixer')
conflicts=('rmixer')
source=(https://github.com/maandree/rmixer/archive/$pkgver.tar.gz)
sha256sums=(6e64ff7cec81c540b9026dfb3816c8367add0a605c25ac2dee703f757f4e404b)

build() {
  cd rmixer-$pkgver
  make -B
}

package() {
  cd rmixer-$pkgver
  make DESTDIR="$pkgdir/" install
}
