# Maintainer: Akatsuki Rui <akiirui@outlook.com>
# Contributor: goetzc
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: grimi

_pkgname=breeze
pkgname=xcursor-breeze-git
pkgver=5.26.90.r124.g9ba24274
pkgrel=1
pkgdesc="KDE Plasma 5 'Breeze' cursor theme. This package is for usage in non-KDE Plasma desktops."
arch=('any')
depends=('libxcursor')
makedepends=('git')
url="https://github.com/KDE/breeze"
license=('GPL')
conflicts=('breeze' 'xcursor-breeze')
source=("git+https://github.com/KDE/breeze.git")
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  git describe --long --tags | sed "s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g"
}

package() {
  install -dm755 "$pkgdir"/usr/share/icons/
  cp -r "$srcdir/$_pkgname"/cursors/Breeze/Breeze/ "$pkgdir"/usr/share/icons/
  cp -r "$srcdir/$_pkgname"/cursors/Breeze_Light/Breeze_Light/ "$pkgdir"/usr/share/icons/
}
