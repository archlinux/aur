# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=rye-bin
pkgver=0.10.0
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
sha256sums=('bcc7abbdacd4e7cf98f396fe5e199e3305be8e564ad50fe2592bd320fda70c8c')
sha256sums_x86_64=('8f6db96bbb4c8fead144094fae27ba6499443bf22b7d3362ffcfc8d4ae2d876e')

package() {
  install -Dm755 "$_pkgbin_x86_64" "$pkgdir/usr/bin/$_pkgname"
  cd "$_pkg/"
  install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$_pkgname/"
}

