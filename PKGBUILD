# Maintainer: Gergely Imreh <imrehg@gmail.com>
# Contributor: Gergely Imreh <imrehg@gmail.com>

pkgname=balena-cli
pkgdesc='balena.io command line interface'
pkgver=9.3.2
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
sha256sums=('d6fd0c5dc66e57bff066715dfc54c65577c4c460a114c348e755a210474f6dc4')

package() {
  npm install --global --only=production --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
}
