# Maintainer: tritonas00 <tritonas00@gmail.com>

pkgname=rigsofrods-bin
pkgver=2022.04
pkgrel=1
pkgdesc='An open source vehicle simulator based on soft-body physics'
arch=('x86_64')
url='https://www.rigsofrods.org'
license=('GPLv3')
depends=('openal' 'nvidia-cg-toolkit' 'openjpeg2')
conflicts=('rigsofrods' 'rigsofrods-git' 'rigsofrods-noangelscript-git')
source=('https://update.rigsofrods.org/rigs-of-rods-linux-2022.04.zip' 'rigsofrods-bin' 'RoR.desktop' 'rigsofrods.png')
md5sums=('1ffa755c741ad0044039f615e7f6177b'
         'a2b0a314317baca59bf00b3dbbc19c96'
         'd08fa6b90c78d12de7772b15af0380a4'
         'eb771473d8e14a8814c6d1d68f25f02d')

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/opt/rigsofrods-bin"
  install -Dm755 rigsofrods-bin "$pkgdir/usr/bin/rigsofrods-bin"
  install -Dm755 RoR.desktop "$pkgdir/usr/share/applications/RoR.desktop"
  install -Dm755 rigsofrods.png "$pkgdir/usr/share/pixmaps/rigsofrods.png"
  install -Dm755 plugins.cfg "${pkgdir}/opt/rigsofrods-bin/plugins.cfg"
  install -Dm755 RoR "${pkgdir}/opt/rigsofrods-bin/RoR"
  cp -r content "${pkgdir}/opt/rigsofrods-bin/content"
  cp -r languages "${pkgdir}/opt/rigsofrods-bin/languages"
  cp -r lib "${pkgdir}/opt/rigsofrods-bin/lib"
  cp -r resources "${pkgdir}/opt/rigsofrods-bin/resources"
  chmod 775 -R "${pkgdir}/opt/rigsofrods-bin/"
}
