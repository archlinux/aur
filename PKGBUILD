# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>
# Previous Maintainer: crasm <crasm@firebase-tools.aur.yooz4sio.vczf.io>
# PKGBUILD structure copied from grunt-cli package

pkgname=firebase-tools
pkgver=6.4.0
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
sha256sums=('6f9a57260cbc58a03e6925bb9fce997edbc3868c30539948fe04fa92bb7a6166')

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
