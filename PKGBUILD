# Maintainer: Sebastien MacDougall-Landry

pkgname=tidalpp
pkgver=0.2
pkgrel=1
pkgdesc='Simple game engine'
url='https://github.com/EmperorPenguin18/tidalpp/'
source=("https://github.com/EmperorPenguin18/$pkgname/archive/$pkgver.tar.gz")
arch=('x86_64')
license=('LGPL3')
depends=('sdl2' 'physfs' 'cjson' 'chipmunk' 'sdl2_image' 'soloud' 'sdl2_fontcache' 'openssl')
sha256sums=('d7e1b99a076f2b598c40a5971efd2032084a8bf5fe518a8471b9775da50b1687')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  make release
}

package () {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 tidalpp -t "$pkgdir/usr/bin"
}
