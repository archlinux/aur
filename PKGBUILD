# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=rkt-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="App container runtime"
arch=('x86_64')
url="https://github.com/coreos/rkt"
license=(apache)
depends=('glibc')
provides=('rkt')
replaces=('rocket')
conflicts=('rocket')
source=(
  "https://github.com/coreos/rkt/releases/download/v${pkgver}/rkt-v${pkgver}.tar.gz"
  "https://github.com/coreos/rkt/releases/download/v${pkgver}/rkt-v${pkgver}.tar.gz.sig"
)
sha256sums=('SKIP' 'SKIP')
validpgpkeys=('18AD5014C99EF7E3BA5F6CE950BDD3E0FC8A365E')
install="${pkgname}.install"
_pkgname=rkt

package() {
  cd "${_pkgname}-v${pkgver}"
  install -Dm755 rkt "$pkgdir/usr/bin/rkt"
  install -Dm644 stage1-coreos.aci "$pkgdir/usr/lib/rkt/stage1.aci"
}

# vim:set ts=2 sw=2 et:
