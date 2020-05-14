# Maintainer: Yamboy1 <yamboyd1@gmail.com>
# Contributor: Alexander Cardosi <alexanderdcardosi@gmail.com>
pkgname=deno-bin
_pkgname=deno
pkgdesc="A secure TypeScript runtime on V8"
pkgver=1.0.0
pkgrel=1
arch=('x86_64')
license=('MIT')
url='http://deno.land/'
provides=('deno')
makedepends=('binutils')
source_x86_64=("${_pkgname}-${pkgver}.zip::https://github.com/denoland/deno/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.zip")
sha256sums_x86_64=('6158af25218377105ec3538eaed2d0fd73ebbf70be70e543027cb3f293ef762a')

prepare() {
  unzip -o "${_pkgname}-${pkgver}.zip"
}

package() {
  mkdir -p "$pkgdir"/usr/bin
  install -Dm0755  "$_pkgname" "$pkgdir"/usr/bin/
  rm -f ../"$_pkgname".zip || true
  rm -f ../../"$_pkgname".zip || true

}
