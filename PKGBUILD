# Build file for the (Arch Linux) Pacman package manager
# Maintainer: Sylvain Chiron <chironsylvain@orange.fr>

pkgname=gengraph
pkgver=v6.3
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
sha256sums=('729ba4ccc33b28d239d84f8611a15799b3975348c5d9bdbb6e21934cde0de401')

build() {
  make -C "${pkgname}-${pkgver}" -j9
}
package() {
  yes | make -C "${pkgname}-${pkgver}" install DESTDIR="${pkgdir}" prefix=/usr
}
