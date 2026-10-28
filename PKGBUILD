# Maintainer: agony <27015 at riseup dot net>

pkgname=rsql-bin
_pkgname=rsql
pkgver=0.21.0
pkgrel=1
pkgdesc='Command line SQL interface for relational databases and common data file formats (prebuilt)'
arch=('x86_64')
url='https://github.com/theseus-rs/rsql'
license=('Apache-2.0 OR MIT')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source_x86_64=("rsql_cli-${pkgver}-x86_64.tar.xz::${url}/releases/download/v${pkgver}/rsql_cli-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('79a5807607a5e2e7d6816d6a5ed31182c9f6ff2bf3500d1c35cda621779daf7c')

package() {
  cd rsql_cli-x86_64-unknown-linux-gnu
  install -Dm755 rsql -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
