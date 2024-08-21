# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Avi Knoll <aknoll at atlassian dot com>

pkgname=mvnvm
pkgver=1.0.29
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
sha256sums=('decc588c89fba7f5e2d5a8e7e2c4586f6a3b92c8b24f572dd2a424b935e515de')

prepare() {
  tar --strip-components 1 -C "${srcdir}" -xf "${pkgname}-${pkgver}.tar.bz2"
}

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/mvn"{,Debug}
}
