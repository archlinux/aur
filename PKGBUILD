# Maintainer: xihale <xihale.top@qq.com>

pkgname=ttf-firacode
pkgver=6.2
pkgrel=1
pkgdesc="FiraCode-Installer, help to copy the FiraCode fonts to usr/share/font"
arch=('any')
url="https://github.com/tonsky/FiraCode"
license=('OFL-1.1')
depends=('fontconfig')
source=("https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip")
md5sums=('77dfd6d902db1ee8d8a6722373ce7933') # 根据实际文件生成的哈希值

package() {

  cd "$srcdir"
  echo "$srcdir"

  sudo cp $srcdir/ttf/*.ttf /usr/share/fonts

  rm -rf $srcdir

}

build() {
  return 0
}

pre_remove(){

  fonts=("Bold" "Light" "Medium" "Regular" "Retina" "SemiBold")

  for it in ${fonts[@]}
  do
    sudo rm /usr/share/fonts/FiraCode-$it.ttf
  done

}
