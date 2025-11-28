# Maintainer: rintim <rintim@foxmail.com>

pkgname=beamup-bin
pkgver=0.8.0
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

sha256sums_x86_64=('ad665433acf69d8cee7e585cfcb0b20482e98055d6d7a79ef075cda5b01f7a6b')
sha256sums_aarch64=('130514a92fa69f71edbb65045853cf2dae08f6632bdedb8a15ea1243f056872a')

