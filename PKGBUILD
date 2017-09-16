# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Andreas Schönfelder <passtschu at freenet dot de>

pkgname='rsyncrypto'
pkgver='1.14'
pkgrel='1'
pkgdesc='sync friendly file encryption'
arch=('i686' 'x86_64')
url='https://rsyncrypto.lingnu.com/'
license=('GPL')
depends=('argtable' 'gzip>=1.7')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('4f1e2605449c7d35b69d77bce95cb652a8ba1a0996b3babd776fcc98a5a7deff')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix='/usr'
  make -s -j1
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
