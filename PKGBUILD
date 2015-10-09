# Maintainer: Félicien PILLOT <felicien.pillot@member.fsf.org>
pkgname=fisoco
pkgver=0.6
pkgrel=1
pkgdesc="a Finding, Sorting and Converting free software"
url="https://github.com/Felandral/Fisoco"
arch=('any')
license=('GPLv3')
depends=()
makedepends=('gtkmm3' 'intltool')
conflicts=()
replaces=()
backup=()
source=("${pkgname}-${pkgver}::https://github.com/Felandral/Fisoco/tarball/mastere")
md5sums=('SKIP')
#pkgver() {
#  cd "$srcdir/$pkgname-$pkgver"
#}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./bootstrap -g
  ./configure --prefix=/usr
  sleep 1
  echo "Compiling..."
  sleep 1
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

