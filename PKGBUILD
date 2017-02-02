# $Id$
# Maintainer: Ido Kanner <idokan@gmail.com>
pkgname=apex-bin
_pkgname=apex
pkgdesc="Build, deploy, and manage AWS Lambda functions with ease (with Go support!)."
pkgver=0.12.0
pkgrel=3
arch=('1686' 'x86_64')
license=('MIT')
url='http://apex.run/'
provides=('apex' 'apex.run')
noextract=()
makedepends=('binutils')
if [[ "$CARCH" == "x86_64" ]]; then
  sha256sums=('ad150361ee484cf21c73609f495c57432ddcd869636d5eca7fcaa61064e67f96')
  _arch="linux_amd64"
else
  sha256sums=('906c3f1e5dac79b676adc87e5f1c4f8d02149d1aad6b209263f22a910ce5d31c')
  _arch="linux_386"
fi
source=("https://github.com/apex/apex/releases/download/v${pkgver}/${_pkgname}_${_arch}")


prepare() {
  mv "${_pkgname}"_"${_arch}" "$_pkgname"
  strip "$_pkgname"
}

package() {
  mkdir -p "$pkgdir"/usr/bin
  install -Dm0755 "$_pkgname" "$pkgdir"/usr/bin
}
