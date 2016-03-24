# Contributor: wicast <wicastchen at hotmail>
# Contributor: Pablo Astigarraga <pote at tardis.com.uy>

pkgname=gvp
pkgver=0.3.0
pkgrel=1
pkgdesc="Go Versioning Packager"
arch=("any")
url="https://github.com/pote/gvp"
license=('MIT')
depends=("go")
optdepends=("go-gpm: download and compile dependence with gvp")
source=(${pkgname}-${pkgver}::https://github.com/pote/${pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('3d7aa96924495d8e961fd04cbd2d763f')


build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make test && make prefix="$pkgdir/usr" install
}
