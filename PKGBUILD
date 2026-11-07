# Maintainer: lingbopro <lingbopro [at] outlook [dot] com>
pkgname=patchsplit
_pkgname=patchsplit
pkgver=1.5.0
pkgrel=1
pkgdesc="A fast, cross-platform CLI tool for splitting and applying patches"
arch=('x86_64')
url="https://github.com/zitzhen/patchsplit"
license=('MIT')
depends=('curl')
source=("$pkgname::git+https://github.com/zitzhen/patchsplit.git#tag=v${pkgver}")
sha256sums=('4a265be17347d652a8a8fea08ef5ad80d357b8c70c0f9d46ca69b74352c5bea6')
build() {
  cd "$pkgname"
  cargo build --release --locked
}
package() {
  cd "$pkgname"
  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "packaging/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  install -Dm644 "debian/copyright" "${pkgdir}/usr/share/doc/${_pkgname}/copyright"
}
