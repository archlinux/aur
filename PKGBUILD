# Maintainer: robertfoster
# Contributor: LIN Rs <LinRs[d]users.noreply.github.com>
# Contributor: yochananmarqos <mark.wagie at tutanota dot com>

_pkgname=devilutionX
pkgname=devilutionx
pkgver=1.3.0
pkgrel=1
pkgdesc="Diablo devolved for linux"
arch=('armv6h' 'armv7h' 'arm' 'aarch64' 'i686' 'x86_64')
url="https://github.com/diasurgical/devilutionX"
license=('custom:unlicense')
depends=('fmt' 'libpng' 'libsodium' 'sdl2')
makedepends=('cmake' 'gettext' 'smpq')
install="${pkgname}".install
options=('strip')
source=("${url}/archive/${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DVERSION_NUM="${pkgver}"

  cmake --build .
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/build"
  DESTDIR=${pkgdir} \
    cmake --install .
}

sha256sums=('3c0a7767444b4a604e99ec5537a240c492b679fedcde521ee7e926a8fc7268fc')
