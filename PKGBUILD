# Maintainer: Gergely Imreh <imrehg@gmail.com>
# Contributor: Gergely Imreh <imrehg@gmail.com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>

pkgname=balena-cli
pkgdesc='balena.io command line interface'
pkgver=9.14.7
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
sha256sums=('ea9a454dff0a05965dce08047580a6f54660761814329570061aea56917f8208')

package() {
  npm install --global --only=production --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
}
