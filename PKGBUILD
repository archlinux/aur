# Maintainer: Kyle Manna < kyle @t kylemanna [d0t] com >
pkgname=sharp-mx-3050to6170-ps
pkgver=1.0
pkgrel=1
pkgdesc="PPD files for Sharp PostScript Printers(MX-3050N to MX-6170FN)"
arch=('i686' 'x86_64')
url="http://www.sharp.com"
license=('GPL')
makedepends=('zip')
depends=('cups')
archive="sharp-${pkgver}-mx-c52-ps.tar"
source=("http://siica.sharpusa.com/Portals/0/downloads/Drivers/${archive}.zip")
sha512sums=('9767b0fdb51e6b24f4fdc686ae22f9d68c004e2275ca0800a681dcacde0f41068d6bb047a17e698f08ee05439ed0fd08af935c5405171fda7126b04b251f5540')

package() {
  cd "$srcdir"
  unzip -o "$archive"
  tar xf "${archive}/${archive}"
  mkdir -p "$pkgdir/usr/share/cups/model/Sharp"
  tar -C $pkgdir/usr/share/cups/model/Sharp -xf ${archive%.tar}/src/ppd.tar
}
