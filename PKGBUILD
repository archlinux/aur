# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=mdliveview
pkgver=1.1
pkgrel=1
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

md5sums=(b985690f7cfd8dab58166325ca47b6f3)

build() {
  cd ${srcdir}/Mdliveview-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/Mdliveview-${pkgver}
  make DESTDIR="${pkgdir}" install
}
