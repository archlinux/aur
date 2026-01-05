# Maintainer: rintim <rintim@foxmail.com>

pkgname=beamup-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="A tool for installing languages (support for Gleam, Erlang and Elixir) that run on the Erlang VM (BEAM) (Prebuilt version)"
arch=('x86_64' 'aarch64')
url="https://tsloughter.github.io/beamup/"
license=('Apache-2.0')

provides=("${pkgname%-bin}=$pkgver")
conflicts=("${pkgname%-bin}")

_githuburl="https://github.com/tsloughter/beamup/"
_rawgithuburl="https://raw.githubusercontent.com/tsloughter/beamup/"

source_x86_64=("$pkgname-$pkgver-x86_64.tar.xz::$_githuburl/releases/download/v$pkgver/${pkgname%-bin}-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$_githuburl/releases/download/v$pkgver/${pkgname%-bin}-aarch64-unknown-linux-gnu.tar.xz")

package() {
  install -Dm755 -t "$pkgdir/usr/bin" beamup-x86_64-unknown-linux-gnu/beamup
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" beamup-x86_64-unknown-linux-gnu/LICENSE
}

sha256sums_x86_64=('820d596f0922b5e8a645b87e80148c541897fc362a0ef9660c512e0690f69690')
sha256sums_aarch64=('27986ee4c012b4cf06d0b4ce48beaeda38dd420545e6b8f9de42a02349fca99b')

