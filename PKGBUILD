# Build file for the (Arch Linux) Pacman package manager
# Maintainer: Sylvain Chiron <chironsylvain@orange.fr>

pkgname=gengraph
pkgver=v6.1
pkgrel=1
pkgdesc='Graph Generator coded in C: graph classes, graph algorithms and output formats'
arch=('x86_64' 'pentium4' 'i686' 'armv7h' 'aarch64')
url="https://gitub.u-bordeaux.fr/cygavoil/${pkgname}"
license=('custom:CeCILL-C')

optdepends=(
  'less: pager for help within the terminal'
  'graphviz: visualization of graphs'
)

source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('421e6674c8c9efaef428d10d50188b0cdb68925b91dbee1a503f095d56fafc77')

build() {
  make -C "${pkgname}-${pkgver}" -j9
}
package() {
  yes | make -C "${pkgname}-${pkgver}" install DESTDIR="${pkgdir}" prefix=/usr
}
