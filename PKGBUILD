# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=mdliveview
pkgver=0.1
pkgrel=2
pkgdesc="Mdliveview is a lightweight Markdown file viewer with autoreload"
url="https://github.com/Geballin/Mdliveview"
arch=('x86_64' 'i686')
license=('BSD')
depends=('tcl' 'tk' 'gifblock' 'tkhtml' 'tkimg')
optdepends=()
makedepends=(make gcc)
conflicts=()
replaces=()
backup=()
install=
source=("https://github.com/Geballin/Mdliveview/archive/${pkgver}.tar.gz")

md5sums=(9ea267e491da0229681c821ccf60c90f)

build() {
  cd ${srcdir}/Mdliveview-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/Mdliveview-${pkgver}
  make DESTDIR="${pkgdir}" install
}
