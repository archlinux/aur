# Maintainer: Jamison Lahman <jamison@lahman.dev>
# Contributor:

pkgname=aligo
pkgver=2.3.0
pkgrel=2
pkgdesc="Utility for checking and viewing Golang struct alignment info"
arch=('any')
url="https://github.com/essentialkaos/aligo"
license=('Apache')
makedepends=('git' 'go' 'make')
_commit='f134c6dbf1afa9debf063b6bba2831f98b8931b0'
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

