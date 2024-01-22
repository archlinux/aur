# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=rye-bin
pkgver=0.19.0
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
sha256sums=('ed77134449db3412b2d2ff9cc6d209acc434760f3a889683d390b5aafd8f5bc4')
sha256sums_x86_64=('b1cdb5489556e7ddc9d76206a03e85eda81c1c291a53ea4ac596646f0b35e0da')

package() {
  install -Dm755 "$_pkgbin_x86_64" "$pkgdir/usr/bin/$_pkgname"
  cd "$_pkg/"
  install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$_pkgname/"
}

