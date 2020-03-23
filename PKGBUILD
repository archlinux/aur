# $Id$
# Maintainer: Ido Kanner <idokan@gmail.com>
pkgname=apex-up
_pkgname=up
pkgdesc="Deploy infinitely scalable serverless apps, apis, and sites in seconds to AWS"
pkgver=1.5.1
pkgrel=1
arch=('i686' 'x86_64')
license=('MIT')
url='https://up.docs.apex.sh/'
provides=('apex-up')
noextract=()
makedepends=('binutils')

[[ "$CARCH" == "i686" ]] && _arch="386"
[[ "$CARCH" == "x86_64" ]] && _arch="amd64"

_local_name="${_pkgname}_linux_${_arch}"

source_i686=("${_pkgname}::https://github.com/apex/up/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.tar.gz")
source_x86_64=("${_pkgname}::https://github.com/apex/up/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums_i686=('8fa86a92c91221024256ab2a5e179327151ebde0b996af3cb07995c6e5084b55')
sha256sums_x86_64=('5cd8ad34983a828163ae274a9b6cfdf4dd8c77d7a7ed2c8d49d1ef0dba3b75ca')

prepare() {
  strip "${_pkgname}"
}

package() {
  mkdir -p "$pkgdir"/usr/bin
  install -Dm0755 "$_pkgname" "$pkgdir"/usr/bin
}

