# Maintainer: Michael Oestergaard <michael at bytopia dot dk>

pkgname=aftershotpro2
pkgver=2.4
pkgrel=1
pkgdesc="Professional Workflow and RAW Conversion"
arch=('x86_64' 'i686')
license=('custom')
replaces=('aftershotpro')
depends=( 'bzip2' 'expat' 'fontconfig' 'freetype2' 'glib2' 'gstreamer0.10' 'gstreamer0.10-base' 'libgl' 'libsm' 'libxdamage' 'libxrender' 'pcre' 'util-linux' )
optdepends=( 'opencl-nvidia' 'opencl-mesa' 'opencl-catalyst' )
source_x86_64=('http://dwnld.aftershotpro.com/updates/v2/2.4/AfterShotPro2_64bit.rpm' 'LICENSE.rtf')
source_i686=('http://dwnld.aftershotpro.com/updates/v2/2.4/AfterShotPro2_32bit.rpm' 'LICENSE.rtf')
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

sha256sums_x86_64=('71e69a689344c9bd5448363c91a8e5cfe8ed8b64b65f93103d96b536a357c456'
                   '45333ed8867b9f09226a4a19bf47ab966e3d735eb4f5dcbc4541a02eda88d2df')

sha256sums_i686=('ae5ad94c7c3e18b9ed9f105c61dd628d2d7d2380a7e29b69541f1d8a7287f489'
                 '45333ed8867b9f09226a4a19bf47ab966e3d735eb4f5dcbc4541a02eda88d2df')
