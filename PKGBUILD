# Maintainer: Marcouney <fora at mrdc dot fr>

pkgname=jpegrescan-git
_pkgname=jpegrescan
pkgver=1.1.0.r14.g4a2fc99
pkgrel=2
pkgdesc="Losslessly shrink any JPEG file"
arch=(any)
url="https://github.com/kud/$_pkgname"
license=('custom')
depends=('perl-file-slurp' 'libjpeg-turbo')
makedepends=('git')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname/"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname/"
  install -Dm755 -t "$pkgdir/usr/bin/" $_pkgname
  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname/" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname/" LICENSE
}
