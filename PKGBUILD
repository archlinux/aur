# Maintainer: Gergely Imreh <imrehg@gmail.com>
# Contributor: Gergely Imreh <imrehg@gmail.com>

pkgname=resin-cli
pkgdesc='Resin.io command line interface'
pkgver=7.2.0
pkgrel=1
arch=('i686' 'x86_64')
url='https://resin.io/'
license=('APACHE')
depends=('nodejs>=6.0.0')
makedepends=('npm' 'python2')
source=(http://registry.npmjs.org/$pkgname/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
options=(!strip)
optdepends=('python: resin-preload')
optdepends_x86_64=('lib32-glibc: emulated builds')
sha256sums=('3771602b1fc3f4044d9bbba74f851022514790ab44a65e9404a00486262dc3e8')

package() {
  npm install --global --only=production --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  rm -r "${pkgdir}/usr/etc"
  find "${pkgdir}" -name "__pycache__" -type d -exec rm -rf '{}' +
}
