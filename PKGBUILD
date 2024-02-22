# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=rye-bin
pkgver=0.25.0
_pkgname="${pkgname%-bin}"
pkgrel=1
pkgdesc="An experimental alternative to poetry, pip, pipenv, venv, virtualenv, pdm, hatch, …"
arch=('x86_64')
url="https://github.com/mitsuhiko/rye"
license=('MIT')
depends=(
  zlib
  openssl
  glibc
  gcc-libs
  libxcrypt-compat # https://github.com/mitsuhiko/rye/issues/15
)
provides=(rye)
conflicts=(rye)
source_x86_64=(
  "rye-$pkgver-x86_64-linux.gz::$url/releases/download/$pkgver/rye-x86_64-linux.gz"
  "https://raw.githubusercontent.com/mitsuhiko/rye/$pkgver/README.md"
  "https://raw.githubusercontent.com/mitsuhiko/rye/$pkgver/LICENSE"
)
sha256sums_x86_64=('f83aa17df98edd48c950b75cd470ac5892cc30ad205f84c26768be0d1189ceb7'
                   '6268d670a9aa72ac8d85cb38e4532fb3427a7f41a7b5410601df3d79fea71b57'
                   '138c155100ff64a7dd31d94e29aaf30b89493a4e53f2424eb064040815bf4ff2')

package() {
  install -Dm755 "rye-$pkgver-x86_64-linux" "$pkgdir/usr/bin/rye"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/rye"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/rye"
}

