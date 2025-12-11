# Maintainer: Jamison Lahman <jamison@lahman.dev>
# Contributor:

pkgname=aligo
pkgver=2.4.0
pkgrel=1
pkgdesc="Utility for checking and viewing Golang struct alignment info"
arch=('any')
url="https://github.com/essentialkaos/aligo"
license=('Apache')
makedepends=('git' 'go' 'make')
_commit='5c1c562e2e3f989d9378d1a7f0f56afb0bf9a2c5'
source=("${pkgname}::git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd "${pkgname}" || exit

  make "${pkgname}"
}

package() {
  cd "${pkgname}" || exit

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
