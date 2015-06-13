# Maintainer: Python Shell <pythonshell@yeah.net>
# Contributor: paraxor <paraxor5344@gmail.com>
# Contributor: Pranay Kanwar <pranay.kanwar@gmail.com>

pkgname=flawfinder
pkgver=1.31
pkgrel=1
pkgdesc="Searches through source code for potential security flaws"
url="http://www.dwheeler.com/flawfinder"
depends=('python2')
license=('GPL')
arch=('i686' 'x86_64')
source=("http://www.dwheeler.com/flawfinder/flawfinder-${pkgver}.tar.gz")
sha256sums=('bca7256fdf71d778eb59c9d61fc22b95792b997cc632b222baf79cfc04887c30')

provides=('flawfinder')

prepare(){
  cd "${srcdir}/flawfinder-${pkgver}"
  sed -i 's/env python/env python2/' flawfinder
}

package() {
  cd "${srcdir}/flawfinder-${pkgver}"
  make "prefix=${pkgdir}/usr" install
}
