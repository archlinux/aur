# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=naturaldocs2
pkgver=2.1.1
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

md5sums=('9e0f23c0112ef535ba11862dbc0a0fe2' '92ec6333b5df1367b8464d0a0f06f49d')

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
