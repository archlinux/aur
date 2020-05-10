# Maintainer: Yamboy1 <yamboyd1@gmail.com>
# Contributor: Alexander Cardosi <alexanderdcardosi@gmail.com>
pkgname=deno-bin
_pkgname=deno
pkgdesc="A secure TypeScript runtime on V8"
pkgver=1.0.0_rc2
_pkgver=1.0.0-rc2
pkgrel=1
arch=('x86_64')
license=('MIT')
url='http://deno.land/'
provides=('deno')
makedepends=('binutils')
source_x86_64=("${_pkgname}-${pkgver}.zip::https://github.com/denoland/deno/releases/download/v${_pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.zip")
sha256sums_x86_64=('8c2240a126d3804550e5ea04d28a1c5c66ecaef7a3f80882c6bb47b8021b968a')

prepare() {
  unzip -o "${_pkgname}-${pkgver}.zip"
}

package() {
  mkdir -p "$pkgdir"/usr/bin
  install -Dm0755  "$_pkgname" "$pkgdir"/usr/bin/
  rm -f ../"$_pkgname".zip || true
  rm -f ../../"$_pkgname".zip || true

}
