# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Avi Knoll <aknoll at atlassian dot com>

pkgname=mvnvm
pkgver=1.0.25
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
sha256sums=('031013a4d93085402bb61dee80d77634b48ba21e166499dce028c617b5057792')

prepare() {
  tar --strip-components 1 -C "${srcdir}" -xf "${pkgname}-${pkgver}.tar.bz2"
}

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/mvn"{,Debug}
}
