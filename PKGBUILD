# Maintainer: Samuel Bernardo <samuelbernardo.mail at gmail dot com>
pkgbase=cstcadnavigator
pkgname=('cstcadnavigator')
pkgver="1.4.1"
pkgrel="1"
pkgdesc="CST CAD Navigator supports 2D and 3D formats, open and convert."
arch=("$CARCH")
license=('LicenseRef-cstCadNavigator')
url='https://cadsofttools.com/products/cst-cad-navigator'
source=("https://cadsofttools.com/download/${pkgbase}-${pkgver}-${pkgrel}.${CARCH}.rpm")
depends=('glibc'
         'glib2'
         'zlib'
         'gcc-libs')
sha256sums=("e84ac132f62bb7b35b3316dc37a386250df19f8d51b16584fc7ff2b5138bd386")

package() {
  install -Dm644 "$srcdir/usr/share/doc/cstcadnavigator/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"
}
