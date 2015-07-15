# $Id$
# Maintainer: Fabien Devaux <fdev 31 @ gmail dot com>
# Contributor: Chris Longo <chris . longo @ gmail dot com>
# NOTE: python-oauth seems lacking so it can use python3

pkgname=httpshell
provides=('httpsh')
_uc_pkg=HttpShell
_auth=chrislongo
pkgver=0.8.0
pkgrel=2
pkgdesc="An interactive shell for issuing HTTP commands to a web server or REST API"
arch=('any')
url="https://github.com/$_auth/$_uc_pkg/"
license=('MIT')
depends=('python2' 'python2-pygments' 'python2-httplib2' 'python2-oauth2')
makedepends=('python2-distribute')
source=(http://github.com/downloads/$_auth/$_uc_pkg/${pkgname}-${pkgver}.tar.gz)
sha256sums=('a639da2fd3f5b98e064df9a5ca9949f153cc948287075112b1c847c1a9bdda42')

build() {
   cd $_auth-$_uc_pkg-*
   python2 setup.py build || exit 1
   python2 setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}

