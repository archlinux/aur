# Maintainer: Gergely Imreh <imrehg@gmail.com>
# Contributor: Gergely Imreh <imrehg@gmail.com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>

pkgname=balena-cli
pkgdesc='balena.io command line interface'
pkgver=9.15.0
pkgrel=1
arch=('i686' 'x86_64')
url='https://balena.io/'
license=('APACHE')
depends=('nodejs>=6.0.0')
makedepends=('npm' 'python2')
source=(http://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
options=(!strip)
optdepends=('python: balena-preload')
optdepends_x86_64=('lib32-glibc: emulated builds')
replaces=('resin-cli')
sha256sums=('58c1b124ef5509071752de9cd8e39b0f39db430f8a6dfad19170e5202d3793b9')

package() {
  npm install --global --only=production --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
}
