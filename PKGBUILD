# Maintainer: John D Jones III jnbek1972 __AT__ $mailservice_by_google __DOT__ com
#TODO: Fix this PKGBUILD to get rid of $srcdir and $pkgdir warnings
_npmname=jsctags
_npmver=5.1.1
pkgname=nodejs-jsctags
pkgver=5.1.1
pkgrel=1
pkgdesc="jsctags is a ctags-compatible code indexing solution for JavaScript."
arch=('any')
url="https://github.com/mozilla/doctorjs"
license=('MIT')
depends=('nodejs' 'npm')
makedepends=('git')
source=("http://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
sha1sums=('024e7b00ce1d1dc9e975ed1205f8f981f3dea6f2')

package() {
  cd "${srcdir}/package/"
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p "${_npmdir}"
  cd "${_npmdir}"
  # npm install -g --prefix "$pkgdir/usr" "$srcdir/doctorjs"
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/package/"
}
# vim:set ts=2 sw=2 et:
