# Maintainer: John D Jones III jnbek1972 __AT__ $mailservice_by_google __DOT__ com
pkgname=nodejs-jsctags
pkgver=0.1.0
pkgrel=1
pkgdesc="jsctags is a ctags-compatible code indexing solution for JavaScript."
arch=('any')
url="https://github.com/mozilla/doctorjs"
license=('MIT')
depends=('nodejs' 'npm')
makedepends=('git')
_npmname=jsctags
source=("http://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
md5sums=('6b355fcbe918a1522180b56cbd96baef')

package() {
  cd "${srcdir}/package/"
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p "${_npmdir}"
  cd "${_npmdir}"
  # npm install -g --prefix "$pkgdir/usr" "$srcdir/doctorjs"
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/package/"
}
# vim:set ts=2 sw=2 et:
