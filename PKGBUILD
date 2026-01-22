# Maintainer: Texas0295 <texas0295@outlook.com>

pkgname=evap
pkgver=0.1
pkgrel=1
pkgdesc="Ephemeral editing buffer with zero residue"
arch=('x86_64')
url="svn://svn.texas0295.top/evap"
license=('MIT')
depends=()
makedepends=('subversion' 'make' 'gcc')
conflicts=('evap-git')
provides=('evap')
options=('!strip')

source=("svn+${url}/tags/v${pkgver}")
sha256sums=('SKIP')
noextract=()

prepare() {
  cd "${srcdir}/v${pkgver}"
}

build() {
  cd "${srcdir}/v${pkgver}"
  make PREFIX=/usr
}

package() {
  cd "${srcdir}/v${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
