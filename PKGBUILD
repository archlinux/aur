# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=php-wikidiff2
pkgver=1.7.1
pkgrel=1
pkgdesc="A PHP module that provides the external diff engine for MediaWiki"
arch=('i686' 'x86_64')
license=('GPL')
url='https://www.mediawiki.org/wiki/Extension:Wikidiff2'
depends=('php' 'libthai')
source=("https://releases.wikimedia.org/wikidiff2/wikidiff2-${pkgver}.tar.gz"{,.sig})
validpgpkeys=('FA1E9F9A41E7F43502CA5D6352FC8E7BEDB7FCA2')
md5sums=('a59df77c591d6e1c7d012680a4587b7b'
         'SKIP')

build() {
  cd "${srcdir}/wikidiff2-${pkgver}"

  phpize
  ./configure
  make
}

package() {
  cd "${srcdir}/wikidiff2-${pkgver}"

  make install INSTALL_ROOT="${pkgdir}"
}
