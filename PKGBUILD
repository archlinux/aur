# Maintainer: zoe <chp321 at gmail dot com>

pkgname=crochetcharts
PkgName=CrochetCharts
PkgName1="Crochet Charts"
pkgver=1.2.0
pkgrel=4
pkgdesc="Pattern design software for crochet charts"
url="http://stitchworkssoftware.com/"
arch=('x86_64')
license=('GPLv3')
makedepends=('tar')
depends=('qt4>=4.8')
source=("https://github.com/StitchworksSoftware/${PkgName}/releases/download/${pkgver}/${PkgName}-${pkgver}-x86_64.deb")
md5sums=('663220d3d0e2b6a0b6de506039e40494')

build() {
  cd ${srcdir}
  tar xvf data.tar.gz
}

package() {
  cd ${srcdir}
  install -D -m755 usr/bin/${PkgName} ${pkgdir}/usr/bin/${pkgname}
  
  cd ${srcdir}/usr/share/applications/
  sed -i 's/CrochetCharts/crochetcharts/g' "${PkgName1}.desktop"
  sed -i 's|Icon=crochetcharts|Icon=/usr/share/icons/hicolor/64x64/apps/crochetcharts-64.png|' "${PkgName1}.desktop"
  install -D -m644 "${PkgName1}.desktop" ${pkgdir}/usr/share/applications/${pkgname}.desktop
  
  cd ${srcdir}/usr/share/  
  install -D -m644 -t ${pkgdir}/usr/share/mime/image/ ${PkgName}/vnd.stitchworks.pattern.xml
  install -D -m644 -t ${pkgdir}/usr/share/doc/${pkgname}/ ${PkgName}/CrochetCharts_User_Guide_1.2.0.pdf
  ## Crochet Charts impose la localisation de CrochetCharts_User_Guide_1.2.0.pdf pour la fonction help de l'appli :
  mkdir ${pkgdir}/usr/share/${PkgName}
  ln -s -T ${pkgdir}/usr/share/doc/${pkgname}/CrochetCharts_User_Guide_1.2.0.pdf \
           ${pkgdir}/usr/share/${PkgName}/CrochetCharts_User_Guide_1.2.0.pdf
  cp -R ${PkgName}/images/ ${pkgdir}/usr/share/doc/${pkgname}/
  
  cd ${srcdir}/usr/share/${PkgName}/icons/
  install -D -m644 ${PkgName}-16.png    ${pkgdir}/usr/share/icons/hicolor/16x16/apps/${pkgname}-16.png
  install -D -m644 ${PkgName}-32.png    ${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}-32.png
  install -D -m644 ${PkgName}-48.png    ${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}-48.png
  install -D -m644 ${PkgName}-64.png    ${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}-64.png
  install -D -m644 ${PkgName}-96.png    ${pkgdir}/usr/share/icons/hicolor/96x96/apps/${pkgname}-96.png
  install -D -m644 ${PkgName}-128.png   ${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}-128.png
  install -D -m644 ${PkgName}-192.png   ${pkgdir}/usr/share/icons/hicolor/192x192/apps/${pkgname}-192.png
  install -D -m644 ${PkgName}-256.png   ${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}-256.png
  install -D -m644 ${PkgName}-512.png   ${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}-512.png
  install -D -m644 ${PkgName}-1024.png  ${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${pkgname}-1024.png
  install -D -m644 ${PkgName}-2048.png  ${pkgdir}/usr/share/icons/hicolor/2048x2048/apps/${pkgname}-2048.png
  install -D -m644 -t ${pkgdir}/usr/share/icons/hicolor/16x16/apps/ stitchworks-pattern-16.png    
  install -D -m644 -t ${pkgdir}/usr/share/icons/hicolor/32x32/apps/ stitchworks-pattern-32.png
  install -D -m644 -t ${pkgdir}/usr/share/icons/hicolor/48x48/apps/ stitchworks-pattern-48.png
  install -D -m644 -t ${pkgdir}/usr/share/icons/hicolor/64x64/apps/ stitchworks-pattern-64.png
  install -D -m644 -t ${pkgdir}/usr/share/icons/hicolor/96x96/apps/ stitchworks-pattern-96.png
  install -D -m644 -t ${pkgdir}/usr/share/icons/hicolor/128x128/apps/ stitchworks-pattern-128.png
  install -D -m644 -t ${pkgdir}/usr/share/icons/hicolor/192x192/apps/ stitchworks-pattern-192.png
  install -D -m644 -t ${pkgdir}/usr/share/icons/hicolor/256x256/apps/ stitchworks-pattern-256.png
  install -D -m644 -t ${pkgdir}/usr/share/icons/hicolor/512x512/apps/ stitchworks-pattern-512.png
  install -D -m644 -t ${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/ stitchworks-pattern-1024.png
  install -D -m644 -t ${pkgdir}/usr/share/icons/hicolor/2048x2048/apps/ stitchworks-pattern-2048.png
}
