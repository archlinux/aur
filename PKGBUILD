# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=naturaldocs2
pkgver=2.3
pkgrel=1
pkgdesc="Readable Source Code Documentation for 20 Programming Languages"
url="https://www.naturaldocs.org/"
arch=('x86_64' 'i686')
license=('AGPLv3')
depends=('mono')
optdepends=()
makedepends=(rsync)
conflicts=()
replaces=()
backup=()
install=
source=("https://www.naturaldocs.org/download/natural_docs/${pkgver}/Natural_Docs_${pkgver}.zip" naturaldocs2)

md5sums=('1bf973b682ce522f77b8353f14221e61' '92ec6333b5df1367b8464d0a0f06f49d')

build() {
  cd "${srcdir}/Natural Docs/"
  }

package() {
  mkdir -p "${pkgdir}/usr/share/${pkgname}/"
  mv "${srcdir}/Natural Docs" naturaldocs
  rsync -a ${srcdir}/naturaldocs/ "${pkgdir}/usr/share/${pkgname}/"
  mkdir -p ${pkgdir}/usr/bin/
  cp ${srcdir}/naturaldocs2 ${pkgdir}/usr/bin/
  }
