# Maintainer: Jamison Lahman <jamison@lahman.dev>
# Contributor:

pkgname=aligo
pkgver=2.5.3
pkgrel=1
pkgdesc="Utility for checking and viewing Golang struct alignment info"
arch=('any')
url="https://github.com/essentialkaos/aligo"
license=('Apache')
makedepends=('git' 'go' 'make')
_commit='9abac81a4ae65054144ace987aa971a48ee327c6'
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
