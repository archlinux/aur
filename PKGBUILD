# Maintainer: Michael Gwin <oksijun+arch at gmail dot com>
# Contributor: Graziano Giuliani <g.giuliani@seco.it>
# Contributor: Pierre Bourdon <delroth@gmail.com>
# Contributor: Arthur Darcet <arthur.darcet@m4x.org>

pkgname=mod_authnz_external
pkgver=3.3.2
pkgrel=2
pkgdesc='Apache External Authentication Modules'
arch=('i686' 'x86_64')
url='https://github.com/phokz/mod-auth-external'
license=('Apache')
makedepends=('apache>=2.4.0')
install=mod_authnz_external.install
source=(https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/mod-auth-external/$pkgname-$pkgver.tar.gz)
sha1sums=('c3b9b25b0c2043d1fd7ab4572a01a9c58f226fc1')

package() {
  cd $srcdir/$pkgname-$pkgver
  make build || return 1
  install -D -m755 .libs/mod_authnz_external.so $pkgdir/usr/lib/httpd/modules/mod_authnz_external.so
}
