# Maintainer: Gergely Imreh <imrehg@gmail.com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>

pkgname=balena-cli
pkgdesc='balena.io command line interface'
pkgver=10.16.0
pkgrel=1
arch=('i686' 'x86_64')
url='https://balena.io/'
_github_url="https://github.com/balena-io/balena-cli"
license=('APACHE')
depends=('nodejs>=6.0.0')
makedepends=('npm' 'python2')
source=(http://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
options=(!strip)
optdepends=('python: balena-preload')
optdepends_x86_64=('lib32-glibc: emulated builds')
replaces=('resin-cli')
sha256sums=('4a11f31bfd0035e9c0b26b05fc902f462b13eca06f7ad23bc220d6c4afc8d9be')

package() {
  npm install --global --only=production --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
}
