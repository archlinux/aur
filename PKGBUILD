# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=rye-bin
pkgver=0.15.2
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
sha256sums=('2ee835db0697645e1a902f47e1404173451dd5624c72c0917330acedef3c4aff')
sha256sums_x86_64=('e649a4c95f459669023b78aba934fde6d98f2be646108070a23b7a5f651d7a01')

package() {
  install -Dm755 "$_pkgbin_x86_64" "$pkgdir/usr/bin/$_pkgname"
  cd "$_pkg/"
  install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$_pkgname/"
}

