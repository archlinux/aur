# $Id$
# Maintainer: Ido Kanner <idokan@gmail.com>
pkgname=apex-bin
_pkgname=apex
pkgdesc="Build, deploy, and manage AWS Lambda functions with ease (with Go support!)."
pkgver=0.15.0
pkgrel=1
arch=('1686' 'x86_64')
license=('MIT')
url='http://apex.run/'
provides=('apex' 'apex.run')
noextract=()
makedepends=('binutils')
if [[ "$CARCH" == "x86_64" ]]; then
  sha256sums=('14ec8deceef3854a6cb0e48b3eb18cd29fcadd9175633561e3f7a52d1bdd95df')
  _arch="linux_amd64"
else
  sha256sums=('14e6792335a96bf880b35388c15b30f61375e6e0e3d679d861649df80e824a55')
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
