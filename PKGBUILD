# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Avi Knoll <aknoll at atlassian dot com>

pkgname=mvnvm
pkgver=1.0.17
pkgrel=1
pkgdesc="Maven version manager"
arch=('any')
url="https://mvnvm.org/"
license=('Apache')
depends=('sh')
conflicts=('maven')
provides=('maven')
source=("https://bitbucket.org/mjensen/mvnvm/get/${pkgname}-${pkgver}.tar.bz2")
noextract=("${pkgname}-${pkgver}.tar.bz2")
sha256sums=('f084a77be98b728961b9ed63a7861015f7e0f4583af8486f40b43a1506833568')

prepare() {
  tar --strip-components 1 -C "${srcdir}" -xf "${pkgname}-${pkgver}.tar.bz2"
}

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/mvn"{,Debug}
}
