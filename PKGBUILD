# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=deno_0.33.0
_pkgname=deno
pkgdesc="A secure TypeScript runtime on V8"
pkgver=0.33.0
pkgrel=0
arch=('x86_64')
license=('MIT')
url='http://deno.land/'
provides=('deno')
makedepends=('binutils')
source_x86_64=("${_pkgname}.gz::https://github.com/denoland/deno/releases/download/v${pkgver}/${_pkgname}_linux_x64.gz")
sha256sums_x86_64=('3a6889a1558b442fd195b68098ae8cce9b459f8c49b6fb923d93e31ef1f4e836')

prepare() {
  gunzip -d --force "${_pkgname}.gz"
}

package() {
  mkdir -p "$pkgdir"/usr/bin
  install -Dm0755  "$_pkgname" "$pkgdir"/usr/bin/
  rm -f ../"$_pkgname".gz || true
  rm -f ../../"$_pkgname".gz || true

}
