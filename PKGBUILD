# Maintainer: Gergely Imreh <imrehg@gmail.com>
# Contributor: Gergely Imreh <imrehg@gmail.com>

pkgname=balena-cli
pkgdesc='balena.io command line interface'
pkgver=9.3.0
pkgrel=1
arch=('i686' 'x86_64')
url='https://resin.io/'
license=('APACHE')
depends=('nodejs>=6.0.0')
makedepends=('npm' 'python2')
source=(http://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
options=(!strip)
optdepends=('python: balena-preload')
optdepends_x86_64=('lib32-glibc: emulated builds')
replaces=('resin-cli')
sha256sums=('ee585c0c7a3b37c0a8cc9bcf0491d2d2c1ec06ae1e6bfc1c27a6e66444716bc3')

package() {
  npm install --global --only=production --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
}
