# Maintainer: Félicien PILLOT <felicien.pillot@member.fsf.org>
pkgname=fisoco
pkgver=alpha
pkgrel=0.6
pkgdesc="a Finding, Sorting and Converting free software"
url="https://github.com/felandral/Fisoco"
arch=('any')
license=('GPLv3')
depends=('gtkmm3')
makedepends=('intltool')
conflicts=()
replaces=()
backup=()
source=("https://github.com/felandral/Fisoco/archive/v${pkgrel}-${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
  cd ${srcdir}/Fisoco-${pkgrel}-${pkgver}
  ./bootstrap -g
  ./configure --prefix=/usr
  sleep 1
  echo "Compiling..."
  sleep 1
  make
}

package() {
  cd "${srcdir}/Fisoco-${pkgrel}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

