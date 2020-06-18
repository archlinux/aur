# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: FadeMind <fademind@gmail.com>

pkgname=vlc-arc-dark-git
pkgver=r8.89fe85c
pkgrel=1
pkgdesc="Arc Dark skin for VLC"
arch=('any')
url="https://github.com/varlesh/VLC-Arc-Dark"
license=('GPL')
depends=('vlc')
makedepends=('git')
provides=('vlc-arc-dark')
conflicts=('vlc-arc-dark')
options=('!strip')
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/$pkgname
  make install DESTDIR="$pkgdir"
}
