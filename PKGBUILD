# $Id$
# Maintainer: Ido Kanner <idokan@gmail.com>
pkgname=apex-bin
_pkgname=apex
pkgver=0.12.0
pkgrel=1
arch=('1686' 'x86_64')
license=('MIT')
url='http://apex.run/'
provides=('apex', 'apex.run')
md5sums=('SKIP')
noextract=()
makedepends=('binutils')
if [[ "$CARCH" == "x86_64" ]]; then
  _arch="linux_amd64"
else
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
