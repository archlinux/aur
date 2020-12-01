# Maintainer: Michael Gwin <oksijun+arch at gmail dot com>
# Contributor: Graziano Giuliani <g.giuliani@seco.it>
# Contributor: Pierre Bourdon <delroth@gmail.com>
# Contributor: Arthur Darcet <arthur.darcet@m4x.org>

pkgname=mod_authnz_external
_gitname=mod-auth-external
pkgver=3.3.3
pkgrel=1
pkgdesc='External Authentication Module for Apache HTTP Server'
arch=('x86_64')
url="https://github.com/phokz/${_gitname}"
license=('Apache')
makedepends=('apache>=2.4.0')
install=mod_authnz_external.install
source=(https://github.com/phokz/${_gitname}/archive/${pkgname}-${pkgver}.tar.gz)
sha256sums=('21795bdcc6d671368871c9202ae64c729efca8a0055a7482a26a06f2e7131eff')

package() {
  cd ${srcdir}/${_gitname}-${pkgname}-${pkgver}
  make build
  install -D -m755 .libs/mod_authnz_external.so $pkgdir/usr/lib/httpd/modules/mod_authnz_external.so
}
