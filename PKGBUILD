# Maintainer: Tobias Martin <tm-x at gmx dot net>

pkgname=cni
pkgver=0.5.2
pkgrel=1
pkgdesc="Specification and libraries for writing plugins to configure network interfaces in Linux containers"
arch=('i686' 'x86_64')
url="https://github.com/containernetworking/cni"
license=('Apache')
makedepends=('go')
depends=('glibc')
source=("https://github.com/containernetworking/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('0e56a32d01c77197ac9bec3bcbfea39db92d01cec6ffdfefa759b9123d724d42f1fb97f71fb666f6444f8e978a6332eacb36a5323edf850c41149c1714b44024')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./build.sh
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/opt/${pkgname}/"
  cp -dr --no-preserve=ownership bin "${pkgdir}/opt/${pkgname}/"

  mkdir -p ${pkgdir}/usr/share/licenses/${_pkgname}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
