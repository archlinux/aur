# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=php-wikidiff2
pkgver=1.7.2
pkgrel=1
pkgdesc="A PHP module that provides the external diff engine for MediaWiki"
arch=('i686' 'x86_64')
license=('GPL')
url='https://www.mediawiki.org/wiki/Extension:Wikidiff2'
depends=('php' 'libthai')
source=("https://releases.wikimedia.org/wikidiff2/wikidiff2-${pkgver}.tar.gz"{,.sig})
validpgpkeys=('FA1E9F9A41E7F43502CA5D6352FC8E7BEDB7FCA2')
sha512sums=('3abd31488b049a860a2b88ce16f525f5641bdbc94e264227d6c54b837cc3630cbd01c45ffd44ae715e3496c2d3b65eee2e54eba4631300beb9c0c6a14a6fdadf'
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
