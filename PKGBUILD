# Maintainer: Félicien PILLOT <felicien.pillot@member.fsf.org>
pkgname=fisoco
pkgver=alpha
pkgrel=0.6
pkgdesc="a Finding, Sorting and Converting free software"
url="https://github.com/Felandral/Fisoco"
arch=('any')
license=('GPLv3')
depends=()
makedepends=('gtkmm3' 'intltool')
conflicts=()
replaces=()
backup=()
source=("${pkgname}-v${pkgrel}-${pkgver}::https://github.com/felandral/Fisoco/archive/v${pkgrel}-${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
  cd ${srcdir}/${pkgname}-v${pkgrel}-${pkgver}
  ./bootstrap -g
  ./configure --prefix=/usr
  sleep 1
  echo "Compiling..."
  sleep 1
  make
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgrel}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

