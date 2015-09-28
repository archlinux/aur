# Maintainer: Michael Oestergaard <michael at bytopia dot dk>

pkgname=aftershotpro
pkgver=2.2.1
pkgrel=2
pkgdesc="Professional Workflow and RAW Conversion"
arch=('x86_64' 'i686')
license=('custom')
depends=( 'bzip2' 'expat' 'fontconfig' 'freetype2' 'glib2' 'gstreamer' 'libgl' 'libsm' 'libxdamage' 'libxrender' 'pcre' 'util-linux' )
optdepends=( 'opencl-nvidia' 'opencl-mesa' 'opencl-catalyst' )
source_x86_64=('http://dwnld.aftershotpro.com/updates/v2/2.2.1/AfterShotPro2_64bit.rpm' 'LICENSE.rtf')
source_i686=('http://dwnld.aftershotpro.com/updates/v2/2.2.1/AfterShotPro2_32bit.rpm' 'LICENSE.rtf')
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

sha256sums_x86_64=('b90ba08be6e419b1d1a6befcb8509257e2844b6c73efd1a70109e0be4e4591c6'
                   '45333ed8867b9f09226a4a19bf47ab966e3d735eb4f5dcbc4541a02eda88d2df')

sha256sums_i686=('2ac8a4b998b3a558af210c40edcfc2c93b4616d69cf31c95b4275d5cf98c0620'
                 '45333ed8867b9f09226a4a19bf47ab966e3d735eb4f5dcbc4541a02eda88d2df')
