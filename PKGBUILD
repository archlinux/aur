# Maintainer: André Silva <emulatorman@parabola.nu>
# Maintainer: Márcio Silva <coadde@parabola.nu>

_pkgname=uzebox
pkgname=uzem
pkgver=3.3
pkgrel=2
pkgdesc="A ${_pkgname^} 8-bit game console emulator"
url="http://belogic.com/$_pkgname"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('sdl')
source=("https://github.com/${_pkgname^}/$_pkgname/archive/$_pkgname-$pkgver.tar.gz")
sha256sums=('d6f5d302df3d58eb536d706e6a830618ac72157bfe15c9c2b2025e4f3091bc38')

build() {
  cd $srcdir/$_pkgname-$_pkgname-$pkgver/tools/$pkgname
  make
}

package() {
  cd $srcdir/$_pkgname-$_pkgname-$pkgver
  install -d "$pkgdir/usr/bin"
  install -Dm755 $srcdir/$_pkgname-$_pkgname-$pkgver/tools/$pkgname/${pkgname}    $pkgdir/usr/bin
  install -Dm755 $srcdir/$_pkgname-$_pkgname-$pkgver/tools/$pkgname/${pkgname}dbg $pkgdir/usr/bin
  # license
  install -Dm644 gpl-3.0.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
