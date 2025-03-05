# Maintainer: Jamison Lahman <jamison@lahman.dev>
# Contributor:

pkgname=aligo
pkgver=2.2.4
pkgrel=1
pkgdesc="Utility for checking and viewing Golang struct alignment info"
arch=('any')
url="https://github.com/essentialkaos/aligo"
license=('Apache')
makedepends=('make' 'go')
_commit='41bd9a9b4a84c9742c8839fbfdf016b8fb2e3881'
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

