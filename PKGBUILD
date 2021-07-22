# Maintainer: Gregory G Danielson III <gregdan3@protonmail.com>

pkgname=doppler-cli-bin
pkgver=3.31.0
pkgrel=1
pkgdesc="A CLI utility for Doppler, environment and secrets manager."
arch=("x86_64")
license=('Apache')
depends=()
url=https://doppler.com
source=("$pkgname.$pkgver.tar.gz::https://cli.doppler.com/download?os=linux&arch=amd64&format=tar")
sha256sums=('2d8d7fe1f0834f66e5fc0456f13ca56455e64a6951db29776dd1264419aec2b6')
_sourcedir=(".")

package() {
  local dataopts='--mode 0644 -D --target-directory'
  local binopts='--mode 0755 -D --target-directory'
  local bindir="$pkgdir/usr/local/bin"
  local shrdir="$pkgdir/usr/share"
  local licdir="$shrdir/licenses/$pkgname"
  local docdir="$shrdir/doc/$pkgname"
  install $dataopts "$licdir" "$_sourcedir/LICENSE"
  install $dataopts "$docdir" "$_sourcedir/README.md"
  install $binopts "$bindir" "$_sourcedir/doppler"
}
