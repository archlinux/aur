pkgname=ldapbrowse
pkgver=0.5
pkgrel=1
pkgdesc="An ncurses-based ldapbrowser"
arch=('i686' 'x86_64')
url="http://github.com/david0/ldapbrowse"
license=('GPL')
depends=('ncurses' 'libldap')
source=("$pkgname-$pkgver.tar.gz::https://github.com/david0/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('980f5279478daa922f71f528e0acd2b8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  install -d "${pkgdir}"/usr/bin/
  install ldapbrowse "${pkgdir}"/usr/bin/ldapbrowse
}

