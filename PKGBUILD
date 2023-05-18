# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=rye-bin
pkgver=0.1.0
_pkgname="${pkgname%-bin}"
_pkg="$_pkgname-$pkgver"
_pkgbin_x86_64="$_pkg-x86_64-linux"
pkgrel=1
pkgdesc="An experimental alternative to poetry, pip, pipenv, venv, virtualenv, pdm, hatch, …"
arch=(x86_64)
url="https://github.com/mitsuhiko/rye"
license=(MIT)
groups=()
depends=(
  zlib
  openssl
  glibc
  gcc-libs
  libxcrypt-compat # https://github.com/mitsuhiko/rye/issues/15
)
provides=(rye)
conflicts=(rye)
source=("$_pkg.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("$_pkgbin_x86_64.gz::$url/releases/download/$pkgver/$_pkgname-x86_64-linux.gz")
sha256sums=('0359c6989cf751836d611824185b4a469e3cda509ffd4401b0bd3cb36a6fb00a')
sha256sums_x86_64=('38656de20395276f831ad3d23e1f29abf9567aa2289e72cedb685d017f894626')

package() {
  install -Dm755 "$_pkgbin_x86_64" "$pkgdir/usr/bin/$_pkgname"
  cd "$_pkg/"
  install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$_pkgname/"
}

