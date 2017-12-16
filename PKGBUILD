# Contributor: Gergely Imreh <imrehg@gmail.com>

pkgname=versionist
pkgdesc='Flexible CHANGELOG generation toolkit that adapts to your commit conventions'
pkgver=2.11.2
pkgrel=1
arch=('any')
url='https://github.com/resin-io/versionist'
license=('APACHE')
depends=('nodejs>=4.0.0')
makedepends=('npm')
source=(http://registry.npmjs.org/$pkgname/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha256sums=('0040288cc44c3be1cd2c09c39fcc3c6d222f3dc9f5c8ff5b1c5d5f2b996aa52d')

package() {
  npm install --global --only=production --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  rm -r "${pkgdir}/usr/etc"
}
