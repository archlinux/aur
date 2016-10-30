# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=php-wikidiff2
pkgver=1.4.1
pkgrel=1
pkgdesc="A PHP module that provides the external diff engine for MediaWiki"
arch=('i686' 'x86_64')
license=('GPL')
url='https://www.mediawiki.org/wiki/Extension:Wikidiff2'
depends=('php' 'libthai')
makedepends=('git')
source=("git+https://gerrit.wikimedia.org/r/p/mediawiki/php/wikidiff2.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
  cd "${srcdir}/wikidiff2"

  phpize
  ./configure
  make
}

package() {
  cd "${srcdir}/wikidiff2"

  make install INSTALL_ROOT="${pkgdir}"
}
