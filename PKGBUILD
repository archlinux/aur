# $Id$
# Maintainer: Ido Kanner <idokan@gmail.com>
pkgname=apex-bin
_pkgname=apex
pkgdesc="Build, deploy, and manage AWS Lambda functions with ease (with Go support!)."
pkgver=0.13.0
pkgrel=1
arch=('1686' 'x86_64')
license=('MIT')
url='http://apex.run/'
provides=('apex' 'apex.run')
noextract=()
makedepends=('binutils')
if [[ "$CARCH" == "x86_64" ]]; then
  sha256sums=('d272b5fd67a7a2a75431d491dc3dea5a9e9db6943442e69538878c18e0f524ab')
  _arch="linux_amd64"
else
  sha256sums=('b0203d4098d1dbbcc04c0cfff5c14d23580e2c76014fb4e4e26ceb57d2a6389f')
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
