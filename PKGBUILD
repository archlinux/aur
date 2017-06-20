# Contributor: Gergely Imreh <imrehg@gmail.com>

pkgname=resin-cli
pkgdesc='Resin.io command line interface'
pkgver=5.11.0
pkgrel=1
arch=('any')
url='https://resin.io/'
license=('APACHE')
depends=('nodejs>=6.0.0')
makedepends=('npm')
source=(http://registry.npmjs.org/$pkgname/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha256sums=('6c13f0f5c299377b8c578f3f4ae507fed5bf4ffddecfaab076852cb8fa7d46af')

package() {
  npm install --global --only=production --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  # remove remaining temp files
  rm -r "${pkgdir}/usr/lib/node_modules/${pkgname}/tmp"
}
