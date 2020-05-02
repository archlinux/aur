# Mainainter:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=php-wikidiff2
pkgver=1.10.0
pkgrel=1
pkgdesc="A PHP module that provides the external diff engine for MediaWiki"
arch=('i686' 'x86_64')
license=('GPL')
url='https://www.mediawiki.org/wiki/Extension:Wikidiff2'
depends=('php' 'libthai')
source=("https://releases.wikimedia.org/wikidiff2/wikidiff2-${pkgver}.tar.gz"{,.sig})
sha512sums=('14110a0f7bc64dff9f90e750cae437c633c1ec6a2e2d6b39e9f11f5b0f736ba574f2764de538a5b5687fb655af71b6d2d8a166226fd0ee900025415e79c700ff'
            'SKIP')
validpgpkeys=('FA1E9F9A41E7F43502CA5D6352FC8E7BEDB7FCA2'
              '83936EF3764977485D3A50344354894545DA0139')

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
