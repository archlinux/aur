# Maintainer: Eugen Kuksa <eugenk@cs.uni-bremen.de>

pkgname=hets-commons
pkgver=0.99_1472225208
pkgrel=1

pkgdesc="Common files of Hets"

url="http://hets.eu"
arch=('i686' 'x86_64')
license=('custom:hets-license')
depends=('java-runtime>=7')
makedepends=('ghc>=7.8.4' 'java-environment=7')
provides=('hets-commons')
conflicts=('hets-commons-bin')
_commit='b8488370dfa4f324561bf90f8dd443696317e385'
source=("${pkgname}::git+https://github.com/spechub/Hets.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
  cd $srcdir/$pkgname
  make jars
}

package() {
  cd $srcdir/$pkgname
  make install-common PREFIX="$pkgdir/usr"
}
