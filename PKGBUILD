# Maintainer: Tianhao Wang <i AT shrik3 DOT com>

pkgname=cyclops
pkgver=0.0.1
pkgrel=1
pkgdesc="simple and convenient TUI for webcam control via v4l2-ctl"
arch=('x86_64')
url="https://github.com/jan-tudos/cyclops"
license=('AGPL-3.0-only')
depends=('v4l-utils')
makedepends=('git')
source=('git+https://github.com/jan-tudos/cyclops.git')
sha256sums=('SKIP')
_commit='02c5d1ed2abf7327ee8dc4b3d7b4ec81b572f85b'

optdepends=(
  'ffmpeg: for previewing via ffplay'
)

package() {
  cd ${srcdir}/${pkgname}
  git checkout ${_commit}
  install -Dm755 cyclops.sh "${pkgdir}/usr/bin/cyclops.sh"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
