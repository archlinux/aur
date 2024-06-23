# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Avi Knoll <aknoll at atlassian dot com>

pkgname=mvnvm
pkgver=1.0.28
pkgrel=1
pkgdesc="Maven version manager"
arch=('any')
url="https://bitbucket.org/mjensen/mvnvm/"
license=('Apache')
depends=('sh')
conflicts=('maven')
provides=('maven')
source=("https://bitbucket.org/mjensen/mvnvm/get/${pkgname}-${pkgver}.tar.bz2")
noextract=("${pkgname}-${pkgver}.tar.bz2")
sha256sums=('32970352e45bdee31e5c7026fa2bddb1d7d32c925fbe2de5acea540b77d03758')

prepare() {
  tar --strip-components 1 -C "${srcdir}" -xf "${pkgname}-${pkgver}.tar.bz2"
}

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/mvn"{,Debug}
}
