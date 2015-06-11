# Maintainer: Christian Mauderer <oss@c-mauderer.de>
pkgname=somanyjaggedshards
_srcname=SoManyJaggedShards
pkgver=1.01
pkgrel=1
pkgdesc="An abstract game about squeezing through awkward spaces."
arch=('i686' 'x86_64')
url="http://www.niallmoody.com/games/so-many-jagged-shards"
license=('gpl')
depends=()
makedepends=('cmake')
source=("http://downloads.niallmoody.com/${_srcname}-${pkgver}-src.zip")
md5sums=('b1018f1909cacef7dc7e601d7a3fa777')

build() {
  cd "${srcdir}/${_srcname}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
} 

package() {
  cd "${srcdir}/${_srcname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 license-art.txt "$pkgdir/usr/share/licenses/$pkgname/license-art.txt"
  install -Dm644 license-code.txt "$pkgdir/usr/share/licenses/$pkgname/license-code.txt"
}

# vim:set ts=2 sw=2 et:
