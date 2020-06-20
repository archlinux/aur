# Maintainer: Yamboy1 <yamboyd1@gmail.com>
# Contributor: Alexander Cardosi <alexanderdcardosi@gmail.com>
pkgname=deno-bin
_pkgname=deno
pkgdesc="A secure TypeScript runtime on V8"
pkgver=1.1.1
pkgrel=1
arch=('x86_64')
license=('MIT')
url='http://deno.land/'
provides=('deno')
makedepends=('binutils' 'unzip')
source_x86_64=("${_pkgname}-${pkgver}.zip::https://github.com/denoland/deno/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.zip")
sha256sums_x86_64=('7ca9340a532a879556d7c721c4a5c2c91b1fbe0bae18c490db568770f5a65472')

prepare() {
  unzip -o "${_pkgname}-${pkgver}.zip"
}

package() {
  mkdir -p "$pkgdir"/usr/bin
  install -Dm0755  "$_pkgname" "$pkgdir"/usr/bin/
  rm -f ../"$_pkgname".zip || true
  rm -f ../../"$_pkgname".zip || true
}
