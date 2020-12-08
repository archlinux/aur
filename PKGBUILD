# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=reqflow
pkgver=1.6.0
pkgrel=1
pkgdesc="A free and open-source tool for traceability of requirements across documents, designed to analyse documents with speed and efficiency"
arch=('x86_64')
url='https://goeb.github.io/reqflow'
license=('GPL2')
depends=('poppler'
         'libzip'
         'libxml2')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/goeb/reqflow/archive/v${pkgver}.tar.gz")
sha256sums=('2cfee36c7a7bf920278dc09a330ff8e2861677f820f16af4c4a6872cc3479ac9')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
