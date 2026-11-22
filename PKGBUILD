# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=bigbrainwordle-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="A tool to help you cheat with the daily wordle"
arch=('x86_64' 'aarch64')
url="https://github.com/kloki/bigbrainwordle"
license=('MIT OR Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/bigbrainwordle-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/bigbrainwordle-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('d4756533fb29ddf8246f13701e3ba768278d810768f507de5c4e7e86dae6e829')
sha256sums_aarch64=('d7fd0d7426f9e380378b5b3c3b2776bdca87b502962a26fac06ce84d2139c161')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="bigbrainwordle-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="bigbrainwordle-aarch64-unknown-linux-gnu" ;;
  esac
  cd "$_dir"
  install -Dm755 "bigbrainwordle" "${pkgdir}/usr/bin/bigbrainwordle"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
