# Maintainer: Jonathan Hilger <joni dot hilger at yahoo dot de>
pkgname=libframeutil-git
pkgver=r9.30048ca
pkgrel=2
pkgdesc="Some DMD frame utilities used by libzedmd and libdmdutil"
arch=('x86_64')
url="https://github.com/ppuc/libframeutil"
license=('GPL-3.0-or-later')
depends=()
makedepends=('git')
provides=('libframeutil' 'libframeutil-git')
source=("${pkgname}::git+https://github.com/PPUC/libframeutil.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}  # pkgver

build() {
  echo "Nothing to build ..."
}  # build

package() {
  install -Dm644 "${srcdir}/${pkgname}/include/FrameUtil.h" "${pkgdir}/usr/include/FrameUtil.h"
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}  # package
