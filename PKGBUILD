# Maintainer: Simeon Schaub <simeondavidschaub99@gmail.com>
pkgname=ion-jl
pkgver=0.1.14
pkgrel=1
pkgdesc="A CLI toolbox for Julia developers"
arch=('x86_64' 'x86' 'aarch64')
url="https://github.com/Roger-luo/Ion"
license=('MIT')
depends=()
makedepends=('rust')
checkdepends=()
optdepends=()
provides=('ion')
conflicts=()
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('aeb05f4e44bb370c5293e12584cceae9')

build() {
  cd "${srcdir}/Ion-$pkgver"
  cargo build --bin ion --release -F bin
}

package() {
  # TODO: ship license file?
  # install -Dm644 "${srcdir}/Ion-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/ion-jl/LICENSE"
  install -Dm755 "${srcdir}/Ion-$pkgver/target/release/ion" "${pkgdir}/usr/bin/ion"
}

# vim: ts=2 sw=2 et:
