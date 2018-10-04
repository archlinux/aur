# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=php-wikidiff2
pkgver=1.7.3
pkgrel=1
pkgdesc="A PHP module that provides the external diff engine for MediaWiki"
arch=('i686' 'x86_64')
license=('GPL')
url='https://www.mediawiki.org/wiki/Extension:Wikidiff2'
depends=('php' 'libthai')
source=("https://releases.wikimedia.org/wikidiff2/wikidiff2-${pkgver}.tar.gz"{,.sig})
validpgpkeys=('FA1E9F9A41E7F43502CA5D6352FC8E7BEDB7FCA2'
              '83936EF3764977485D3A50344354894545DA0139')
sha512sums=('627bff161fdf7752148c8e1d1d2b5b73fa88bfcd3716884fe488cb7d52fdfa1cc143bcd9d1fd93e065365a746dc93ab852704fad73941b33030bac10be1debf3'
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
