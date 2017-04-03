# $Id$
# Maintainer: Ido Kanner <idokan@gmail.com>
pkgname=apex-bin
_pkgname=apex
pkgdesc="Build, deploy, and manage AWS Lambda functions with ease (with Go support!)."
pkgver=0.14.0
pkgrel=1
arch=('1686' 'x86_64')
license=('MIT')
url='http://apex.run/'
provides=('apex' 'apex.run')
noextract=()
makedepends=('binutils')
if [[ "$CARCH" == "x86_64" ]]; then
  sha256sums=('690a3a05931bee066052a667fd1ea3de5a9965b47b20d369e7758aeeaee47214')
  _arch="linux_amd64"
else
  sha256sums=('63fb2c97863cc0bdfc253013addee41a29a53ec3ba08a83fc121ac3d29c08415')
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
