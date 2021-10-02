# Maintainer: Gregory G Danielson III <gregdan3@protonmail.com>

pkgname=doppler-cli-bin
pkgver=3.33.0
pkgrel=1
pkgdesc="A CLI utility for Doppler, environment and secrets manager."
arch=("x86_64")
license=('Apache')
depends=()
url=https://doppler.com
source=("$pkgname.$pkgver.tar.gz::https://cli.doppler.com/download?os=linux&arch=amd64&format=tar")
sha256sums=('7f4580ebccdc3e7efa824143379016907caabad65e4a95ee2e0cfb050715adc7')
_sourcedir=(".")

package() {
  local dataopts='--mode 0644 -D --target-directory'
  local binopts='--mode 0755 -D --target-directory'
  local bindir="$pkgdir/usr/bin"
  local shrdir="$pkgdir/usr/share"
  local licdir="$shrdir/licenses/$pkgname"
  local docdir="$shrdir/doc/$pkgname"
  install $dataopts "$licdir" "$_sourcedir/LICENSE"
  install $dataopts "$docdir" "$_sourcedir/README.md"
  install $binopts "$bindir" "$_sourcedir/doppler"
}
