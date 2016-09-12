# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Gabriel Fornaeus <gf@hax0r.se>
_pkgname=arc-colors-revival
pkgname=${_pkgname}-git
pkgver=v0.1.r1.gda24820
pkgrel=1
pkgdesc="This is a set of backgrounds (and their sources) created to fit with the gnome-colors-revival icon theme and shiki-colors-revival GTK theme."
arch=('any')
url="https://github.com/Somasis/arc-colors-revival"
license=('GPL')
groups=()
depends=()
makedepends=('git' 'make')
source=(${pkgname}::git+https://github.com/Somasis/arc-colors-revival#branch=master)
sha256sums=('SKIP') 

_gitname="https://github.com/Somasis/arc-colors-revival"

pkgver() {
    cd "$pkgname"
      git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"

  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
