# Maintainer: tritonas00 <tritonas00@gmail.com>

pkgname=rigsofrods-bin
pkgver=2021.04
pkgrel=1
pkgdesc='An open source vehicle simulator based on soft-body physics'
arch=('x86_64')
url='https://www.rigsofrods.org'
license=('GPLv3')
depends=('openal' 'nvidia-cg-toolkit' 'openjpeg2')
conflicts=('rigsofrods' 'rigsofrods-git' 'rigsofrods-noangelscript-git')
source=('https://files.rigsofrods.org/rigs-of-rods-linux-2021.04.zip' 'rigsofrods-bin' 'RoR.desktop' 'rigsofrods.png')
md5sums=('b4e081ed039f5c49a26ea54f26dae899'
         'a2b0a314317baca59bf00b3dbbc19c96'
         'd08fa6b90c78d12de7772b15af0380a4'
         'eb771473d8e14a8814c6d1d68f25f02d')

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/opt/rigsofrods-bin"
  cp -r content "${pkgdir}/opt/rigsofrods-bin/content"
  cp -r languages "${pkgdir}/opt/rigsofrods-bin/languages"
  cp -r lib "${pkgdir}/opt/rigsofrods-bin/lib"
  cp -r resources "${pkgdir}/opt/rigsofrods-bin/resources"
  cp plugins.cfg "${pkgdir}/opt/rigsofrods-bin/plugins.cfg"
  cp RoR "${pkgdir}/opt/rigsofrods-bin/RoR"
  install -Dm755 rigsofrods-bin "$pkgdir/usr/bin/rigsofrods-bin"
  install -Dm755 RoR.desktop "$pkgdir/usr/share/applications/RoR.desktop"
  install -Dm755 rigsofrods.png "$pkgdir/usr/share/pixmaps/rigsofrods.png"
}
