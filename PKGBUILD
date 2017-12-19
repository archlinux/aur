# Maintainer: Tobias Martin <tm-x at gmx dot net>

pkgname=cni
pkgver=0.6.0
pkgrel=2
pkgdesc="Specification and libraries for writing plugins to configure network interfaces in Linux containers"
arch=('i686' 'x86_64')
url="https://github.com/containernetworking/cni"
license=('Apache')
makedepends=('go')
depends=('glibc')
source=("https://github.com/containernetworking/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('3b5b35ed546f82a939b3090ac49d2f7ab0542a079d0f45b0dd9b45cf4849abb6c10fbcb810b7567a7a15d6b8144f5b3962bfca319a37342c5bc39f5fa58f0777')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./build.sh
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/opt/${pkgname}/"
  cp -dr --no-preserve=ownership bin "${pkgdir}/opt/${pkgname}/"

  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
