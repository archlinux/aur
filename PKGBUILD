# Maintainer: Gergely Imreh <imrehg@gmail.com>
# Contributor: Gergely Imreh <imrehg@gmail.com>

pkgname=resin-cli
pkgdesc='Resin.io command line interface'
pkgver=7.9.2
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
sha256sums=('c1107089498d89565c815d3e15017f66a24b275e41374d6f4932922d7368a0fb')

package() {
  npm install --global --only=production --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
}
