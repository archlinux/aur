# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: max.bra <max.bra at alice dot it>
# Contributor: SeeSchloss <seeschloss@seos.fr>

pkgname=unoconv
pkgver=0.9
pkgrel=2
pkgdesc="Libreoffice-based document converter"
url="http://dag.wiee.rs/home-made/unoconv"
depends=(python libreoffice)
makedepends=(asciidoc git)
arch=(any)
license=(GPL2)
_commit=4cf0e54460bf27db8153951a78b3860d4f810fea  # tags/0.9
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
