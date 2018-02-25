# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: max.bra <max.bra at alice dot it>
# Contributor: SeeSchloss <seeschloss@seos.fr>

pkgname=unoconv
pkgver=0.8.2
pkgrel=1
pkgdesc="Libreoffice-based document converter"
url="http://dag.wiee.rs/home-made/unoconv"
depends=(python libreoffice)
makedepends=(asciidoc git)
arch=(any)
license=(GPL2)
_commit=7f044854cc2b75d3ba988411f5f9f0c2483169cd  # tags/0.8.2
source=("git+https://github.com/dagwieers/unoconv#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
