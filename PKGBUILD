# $Id$
# Maintainer: Ido Kanner <idokan@gmail.com>
pkgname=apex-up
_pkgname=up
pkgdesc="Deploy infinitely scalable serverless apps, apis, and sites in seconds to AWS"
pkgver=1.3.0
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
sha256sums_i686=('eafb20bb2c1884ee14082d37184bfc04db7dd4df041cd90c6ff54c9513a6dc9e')
sha256sums_x86_64=('03753b9f388a2d33f7f5d61cd8a34b06dcca85c2a6b3ae70ebcb31bdcc95f939')

prepare() {
  strip "${_pkgname}"
}

package() {
  mkdir -p "$pkgdir"/usr/bin
  install -Dm0755 "$_pkgname" "$pkgdir"/usr/bin
}

