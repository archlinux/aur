# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Contributor: Gergely Imreh <imrehg(at)gmail(dot)com>

pkgname=tamu-anova
pkgver=0.2.1
pkgrel=7
pkgdesc="ANOVA Extensions to the GNU Scientific Library"
arch=('x86_64')
url="https://www.stat.tamu.edu/~aredd/tamuanova/"
license=('GPL')
depends=('gsl')
makedepends=('gcc')
options=('staticlibs')
source=(https://sources.archlinux.org/other/packages/tamu_anova/tamu_anova-0.2.1.tar.gz)
sha1sums=('8c7ffae14ebe92f27d20ff1f0e325875fa6ced53')

build() {
  cd tamu_anova-0.2
  ./configure --prefix=/usr \
              --infodir=/usr/share/info \
              --includedir=/usr/include
  make
}

package() {
  cd tamu_anova-0.2
  make DESTDIR="${pkgdir}" install
}
