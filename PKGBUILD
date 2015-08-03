# Maintainer: Will Price <will.price94+aur@gmail.com>
pkgname=antlrworks
pkgver=2.1
pkgrel=1
pkgdesc="A netbeans based grammar IDE"
arch=('x86_64' 'i686')
url="http://tunnelvisionlabs.com/products/demo/antlrworks"
license=('GPL')
depends=('java-environment')
makedepends=()
options=(!strip libtool staticlibs)
source=("http://tunnelvisionlabs.com/downloads/antlr/2013-07-21-${pkgname}-${pkgver}.zip")
md5sums=('1460c73704e1bda9182b7279f9ca9b6e')

package() {
	cd "${srcdir}/${pkgname}${pkgver%%.*}"
	mkdir -p "${pkgdir}/"{etc,usr/{share/antlrworks,bin}}
  chmod +x bin/antlrworks2
  cp -r * "${pkgdir}/usr/share/antlrworks"
  #mv "${pkgdir}/usr/share/antlrworks/etc" "${pkgdir}/"

  cd "${pkgdir}/usr/bin"
  ln -s "/usr/share/antlrworks/bin/antlrworks2" antlrworks
}
