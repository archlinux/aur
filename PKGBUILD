# Maintainer: zoe <chp321 at gmail dot com>

pkgname=crochetcharts
_PkgName=CrochetCharts
_PkgName1="Crochet Charts"
pkgver=1.2.0
pkgrel=2
pkgdesc="Pattern design software for crochet charts"
url="http://stitchworkssoftware.com/"
arch=('x86_64')
license=('GPLv3')
makedepends=('tar')
depends=('qt4>=4.8')
source=("https://github.com/StitchworksSoftware/${_PkgName}/releases/download/${pkgver}/${_PkgName}-${pkgver}-x86_64.deb")
md5sums=('663220d3d0e2b6a0b6de506039e40494')

package() { 
  cd $srcdir
  ar x "${_PkgName}-${pkgver}-x86_64.deb"
  tar xvf data.tar.gz
  cp -rp usr $pkgdir
  mkdir -p $pkgdir/usr/share/applications
  cd $pkgdir
  mv usr/bin/${_PkgName} usr/bin/${pkgname}
  mv "usr/share/applications/${_PkgName1}.desktop" usr/share/applications/${pkgname}.desktop
  sed -i 's/CrochetCharts/crochetcharts/g' usr/share/applications/${pkgname}.desktop
  sed -i 's|Icon=crochetcharts|Icon=/usr/share/CrochetCharts/icons/CrochetCharts-64.png|' usr/share/applications/${pkgname}.desktop
}
