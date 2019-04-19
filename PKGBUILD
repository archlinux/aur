# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>
# Previous Maintainer: crasm <crasm@firebase-tools.aur.yooz4sio.vczf.io>
# PKGBUILD structure copied from grunt-cli package

pkgname=firebase-tools
pkgver=6.7.0
pkgrel=0
pkgdesc="The Firebase Command Line Tools"
arch=('any')
url="https://firebase.google.com/docs/cli/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
provides=('nodejs-firebase-tools')
conflicts=('nodejs-firebase-tools')
replaces=('nodejs-firebase-tools')
install=${pkgname}.install
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=(${pkgname}-${pkgver}.tgz)
sha256sums=('a290243a9da1fabd883640e0da45f9b0a1d381c826e8b7d67c18c1e5ff997894')

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
