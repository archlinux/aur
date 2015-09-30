# Maintainer: Michael Oestergaard <michael at bytopia dot dk>

pkgname=aftershotpro
pkgver=2.2.2
pkgrel=1
pkgdesc="Professional Workflow and RAW Conversion"
arch=('x86_64' 'i686')
license=('custom')
depends=( 'bzip2' 'expat' 'fontconfig' 'freetype2' 'glib2' 'gstreamer' 'libgl' 'libsm' 'libxdamage' 'libxrender' 'pcre' 'util-linux' )
optdepends=( 'opencl-nvidia' 'opencl-mesa' 'opencl-catalyst' )
source_x86_64=('http://dwnld.aftershotpro.com/updates/v2/2.2.2/AfterShotPro2_64bit.rpm' 'LICENSE.rtf')
source_i686=('http://dwnld.aftershotpro.com/updates/v2/2.2.2/AfterShotPro2_32bit.rpm' 'LICENSE.rtf')
url="http://www.aftershotpro.com/en/support/updates"
install="aftershotpro.install"

package() {
  mv ${srcdir}/opt ${pkgdir}/
  install -d ${pkgdir}/usr/share
  mv ${srcdir}/usr/bin ${pkgdir}/usr/
  mv ${srcdir}/usr/share/{applications,pixmaps} ${pkgdir}/usr/share/
  install -d ${pkgdir}/usr/share/mime/packages/
  mv ${srcdir}/usr/share/mime/packages/* ${pkgdir}/usr/share/mime/packages/
  install -Dm644 LICENSE.rtf ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rtf
}

sha256sums_x86_64=('6f00775d62092a9e1d7bfcf14fe1b20cae7ab6496246a40306703b3d2ecc4a35'
                   '45333ed8867b9f09226a4a19bf47ab966e3d735eb4f5dcbc4541a02eda88d2df')

sha256sums_i686=('05495a0c88a7f64535f8a22a065b74a1d8900449c6e3a0a1786a157e934f6df4'
                 '45333ed8867b9f09226a4a19bf47ab966e3d735eb4f5dcbc4541a02eda88d2df')
