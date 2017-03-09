# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=php-wikidiff2
pkgver=1.4.1
pkgrel=2
pkgdesc="A PHP module that provides the external diff engine for MediaWiki"
arch=('i686' 'x86_64')
license=('GPL')
url='https://www.mediawiki.org/wiki/Extension:Wikidiff2'
depends=('php' 'libthai')
source=("https://releases.wikimedia.org/wikidiff2/wikidiff2-${pkgver}.tar.gz")
md5sums=('2eba9ae0a8583de42a8f7010595a8eaa')

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
