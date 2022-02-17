# Maintainer: Aleksandre Khokhiashvili <skhokhi[at]gmail[dot]com>

pkgname=afltriage-git
_pkgname=AFLTriage
pkgver=1.0.0
pkgrel=1
pkgdesc='A tool to automatically triage crashing input files using a debugger'
url='https://github.com/quic/AFLTriage'
arch=('x86_64')
license=('custom')
depends=('gdb')
makedepends=('cargo')
source=("git+https://github.com/quic/${_pkgname}")
sha256sums=(SKIP)

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm 755 target/release/afltriage -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
