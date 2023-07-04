# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Avi Knoll <aknoll at atlassian dot com>

pkgname=mvnvm
pkgver=1.0.23
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
sha256sums=('a5ca03f1d02cdca4d2dbf6f07c53f01836f1b7ed08eb6eb7b1dfe96d72632a88')

prepare() {
  tar --strip-components 1 -C "${srcdir}" -xf "${pkgname}-${pkgver}.tar.bz2"
}

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/mvn"{,Debug}
}
