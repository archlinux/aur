# Maintainer: Simeon Schaub <simeondavidschaub99@gmail.com>
pkgname=juliaup
pkgver=1.2.18
pkgrel=1
pkgdesc="An experimental Julia version manager"
arch=('x86_64' 'x86' 'aarch64')
url="https://github.com/JuliaLang/juliaup"
license=('MIT')
depends=()
makedepends=('rust')
checkdepends=()
optdepends=()
provides=()
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('d5e11974772389190eaae836291287b7')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  cargo build --release
}

package() {
  install -Dm644 "${srcdir}/$pkgname-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/juliaup/LICENSE"
  install -Dm755 "${srcdir}/$pkgname-$pkgver/target/release/juliaup" "${pkgdir}/usr/bin/juliaup"
  install -Dm755 "${srcdir}/$pkgname-$pkgver/target/release/julialauncher" "${pkgdir}/usr/bin/julialauncher"
}

# vim: ts=2 sw=2 et:
