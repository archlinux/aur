# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=mothur
pkgver=1.43.0
pkgrel=1
pkgdesc='A bioinformatics program for analyzing microbial communities.'
arch=('x86_64')
url='https://www.mothur.org/'
license=('GPL3')
depends=('boost-libs')
makedepends=('boost' 'hdf5')
options=('!buildflags')
source=("https://github.com/${pkgname}/${pkgname}/archive/v.${pkgver}.tar.gz")
sha256sums=('e2b90a9d0ddcc521a9252f9a5d82d1613688de42bbec74bfa4c94dc6d2525530')

build() {
  cd "${pkgname}-v.${pkgver}"

  make
}

package() {
  cd "${pkgname}-v.${pkgver}"

  install -Dm755 mothur "${pkgdir}/usr/bin/mothur"
  install -Dm755 uchime "${pkgdir}/usr/bin/uchime"
}
