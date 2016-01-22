pkgname=ldapbrowse
pkgver=0.2
pkgrel=1
pkgdesc="An ncurses-based ldapbrowser"
arch=('i686' 'x86_64')
url="http://github.com/david0/ldapbrowse"
license=('GPL')
depends=('ncurses' 'libldap')
source=("$pkgname-$pkgver.tar.gz::https://github.com/david0/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('25e50b83c55d316b18743d805993d3b6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  install -d "${pkgdir}"/usr/bin/
  install ldapbrowse "${pkgdir}"/usr/bin/ldapbrowse
}

