# Maintainer: Tobias Martin <tm-x at gmx dot net>

pkgname=cni
pkgver=0.7.1
pkgrel=2
pkgdesc="Specification and libraries for writing plugins to configure network interfaces in Linux containers"
arch=('i686' 'x86_64')
url="https://github.com/containernetworking/cni"
license=('Apache')
makedepends=('go')
depends=('glibc')
source=("https://github.com/containernetworking/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('ca97ad8cd693a50c7c793266e23c2c38c4cb6917dc38c68f88921f48daf437375aa2d347eba70c8dc4e08ba6e6f008e0164282029fa36aab98417e763eb29285')

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
