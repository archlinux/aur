# Maintainer: Connor Etherington <nu1l@null.net>
# ---
pkgname=pkgdl
pkgver=1.0.r3
pkgrel=1
pkgdesc='Simple script making simultaneously downloading packages from various sources a breeze'
arch=(x86_64)
url="https://gitlab.com/qYp/${pkgname}"
license=('MIT')
depends=(paru)
makedepends=()                 
optdepends=(
  'npm: To download node packages'
  'snapd: To install snap packages'
  'flatpak: To install flatpak packages'
  )
source=(
  "https://gitlab.com/qYp/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://gitlab.com/qYp/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha256sums=(
  'b91949cd6e5753da0ccd68c91f33d2e8c41a411ad811c2734955776ec23df9b2'
  '954f5d75e18681921528c360f5b0b19dac484ee4755b4fcaf990d574e25eb49a'
  )

pkgver() {
  printf "1.0.r$(git rev-list --count HEAD)"
}

package() {
  install -Dm775 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 usr/share/doc/${pkgname}/README "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
