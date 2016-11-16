# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
pkgname=rmixer
pkgver=1.3.1
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
sha256sums=(0409aaf04533677d3c1ced72ceb8dbac74b01d8bb5b79cdb6a7961284ac26f65)

build() {
  cd rmixer-$pkgver
  make -B
}

package() {
  cd rmixer-$pkgver
  make DESTDIR="$pkgdir/" install
}
