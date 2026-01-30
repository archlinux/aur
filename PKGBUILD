# Build file for the (Arch Linux) Pacman package manager
# Maintainer: Sylvain Chiron <chironsylvain@orange.fr>

pkgname=gengraph
pkgver=v6.4
pkgrel=1
pkgdesc='Graph Generator coded in C: graph classes, graph algorithms and output formats'
arch=('x86_64' 'pentium4' 'i686' 'armv7h' 'aarch64')
url="https://gitub.u-bordeaux.fr/cygavoil/${pkgname}"
license=('CECILL-C')

optdepends=(
  'less: pager for help within the terminal'
  'graphviz: visualization of graphs'
)

source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('cc601f06c8712e011062986bc62a04b568863b41bca82b85648a3ebc3d47d525')

build() {
  make -C "${pkgname}-${pkgver}" -j9
}
package() {
  yes | make -C "${pkgname}-${pkgver}" install DESTDIR="${pkgdir}" prefix=/usr
}
