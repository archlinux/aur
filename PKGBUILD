# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgbase=archide
pkgname=archide
pkgver=0.2.1.alpha
pkgrel=1
pkgdesc='A tiny utility to create, edit and upload your AUR packages'
arch=('any')
url='https://christopherloen.github.io/ArchIDE'
license=('MIT')
depends=('jre8-openjdk' 'gedit' 'jeeves')
source=('git://github.com/christopherloen/ArchIDE.git')
md5sums=('SKIP')
install="archide.install"
package(){
  cd ArchIDE
  install -d "${pkgdir}/home/$USER/.archide/"
  install -dm755 "${pkgdir}/usr/bin/"
  cp archide.conf "${pkgdir}/home/$USER/.archide/"
  cp archide.log "${pkgdir}/home/$USER/.archide/"
  cp ArchIDE.jar "${pkgdir}/home/$USER/.archide/"
  echo "#!/bin/bash" >> "${pkgdir}/usr/bin/archide"
  echo "cd ~/.archide && java -jar ArchIDE.jar" >> "${pkgdir}/usr/bin/archide"
  chmod +x "${pkgdir}/usr/bin/archide"
}
