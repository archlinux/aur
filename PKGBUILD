# Contributor: Gergely Imreh <imrehg@gmail.com>

pkgname=versionist
pkgdesc='Flexible CHANGELOG generation toolkit that adapts to your commit conventions'
pkgver=2.9.0
pkgrel=1
arch=('any')
url='https://github.com/resin-io/versionist'
license=('APACHE')
depends=('nodejs>=4.0.0')
makedepends=('npm')
source=(http://registry.npmjs.org/$pkgname/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha256sums=('871dd01c5b9b6cbe35b0ebe265f076e6549c8a1fd8d62e370828fcf4dd7c8eb5')

package() {
  npm install --global --only=production --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  rm -r "${pkgdir}/usr/etc"
}
