# Maintainer: ahrs <Forward dot to at hotmail dot co dot uk>

pkgname=nougat-git
_pkgname=nougat
pkgver=v1.r15.g15c501d
pkgrel=1
pkgdesc='Screenshot wrapper'
arch=(any)
url='https://github.com/Sweets/nougat'
license=('MIT')
optdepends=(
  'maim: Maim backend support'
  'imagemagick: ImageMagick backend support'
  'slop: ImageMagick backend support'
  'xclip: Clipboard support'
)
provides=('nougat')
conflicts=('nougat')

pkgver() {
  cd "$_pkgname"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

source=(
  "nougat::git+https://github.com/Sweets/nougat.git"
)

sha512sums=('SKIP')

package() {
  install -dm755 "$pkgdir"/usr/bin

  install -Dm755 "$srcdir"/$_pkgname/$_pkgname "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "$srcdir"/$_pkgname/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir"/$_pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
