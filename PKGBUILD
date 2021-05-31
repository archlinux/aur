# Maintainer: shiliang <shiliang2008@msn.com>

pkgname=chez-srfi
_pkgname=chez-srfi
pkgdesc='SRFI for ChezScheme'
pkgver=1.2
pkgrel=1
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/shih-liang/chez-srfi'
license=('MIT')
depends=('chez-scheme')
source=( ${_pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/shih-liang/chez-srfi/archive/refs/tags/v${pkgver}.tar.gz)
md5sums=('93a7dfa3f2e3a5ebe06de69346449a30')
provides=('chez-srfi')

build(){
  cd ${_pkgname}-${pkgver}
  make CHEZ=scheme
}
package(){
  cd ${_pkgname}-${pkgver}
  make install CHEZ=scheme PREFIX=${pkgdir}/usr
}

