# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>
pkgname=vcat
pkgver=0.3
pkgrel=1
pkgdesc="outputs a video on a 256-color enabled terminal with UTF-8 locale"
arch=('i686' 'x86_64')
url="https://github.com/GeeckoDev/vcat"
license=('BSD')
depends=('ffmpeg')
provides=('vcat')
conflicts=('vcat-git')
source=(https://github.com/GeeckoDev/vcat/archive/${pkgver}.tar.gz)
md5sums=('7982f6d7601fad8b89c178719617c9bf')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 vcat $pkgdir/usr/bin/vcat
}
