# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=rye-bin
pkgver=0.17.0
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
sha256sums=('fc69d04e5fd994b8862b4fa9e2971de885f07d286df64c9d2d49e40d6d1d7ddb')
sha256sums_x86_64=('92a3f3727ea71c524a8a193fdc3bce6cc0588baf4510170423188ec8c4df23b1')

package() {
  install -Dm755 "$_pkgbin_x86_64" "$pkgdir/usr/bin/$_pkgname"
  cd "$_pkg/"
  install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$_pkgname/"
}

