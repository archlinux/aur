# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=php-wikidiff2
pkgver=1.5.1
pkgrel=1
pkgdesc="A PHP module that provides the external diff engine for MediaWiki"
arch=('i686' 'x86_64')
license=('GPL')
url='https://www.mediawiki.org/wiki/Extension:Wikidiff2'
depends=('php' 'libthai')
source=("https://releases.wikimedia.org/wikidiff2/wikidiff2-${pkgver}.tar.gz")
md5sums=('46e79c14099a24fe9fdffa6d6a4bd530')

build() {
  cd "${srcdir}/mediawiki-${pkgname}-${pkgver}"

  phpize
  ./configure
  make
}

package() {
  cd "${srcdir}/mediawiki-${pkgname}-${pkgver}"

  make install INSTALL_ROOT="${pkgdir}"
}
