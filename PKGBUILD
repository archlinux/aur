# Maintainer:  Frederic Bezies <fredbezies at gmail.com>
# Contributor: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: felix <at yandex.com, m.p.isaev>

pkgname=({freedm,freedoom1,freedoom2}-git)
pkgbase=freedoom-git
pkgdesc="Free game data files for Doom gaming engines"
pkgver=0.12.0.r2.ga9afb194
pkgrel=1
epoch=1
arch=('any')
url="http://freedoom.github.io/"
license=('BSD')
makedepends=('asciidoc' 'deutex' 'python' 'python-pillow')
source=(git+https://github.com/freedoom/freedoom.git)
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/freedoom"
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/freedoom"
  make
}

package_freedm-git() {
  provides=('freedoom' 'freedm')

  cd "$srcdir/freedoom"
  make prefix=/usr DESTDIR="$pkgdir" install-freedm
}

package_freedoom1-git() {
  provides=('freedoom' 'freedoom1')

  cd "$srcdir/freedoom"
  make prefix=/usr DESTDIR="$pkgdir" install-freedoom1
}

package_freedoom2-git() {
  provides=('freedoom' 'freedoom2')

  cd "$srcdir/freedoom"
  make prefix=/usr DESTDIR="$pkgdir" install-freedoom2
}
