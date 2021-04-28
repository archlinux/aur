# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

# Since you need to purchase this game, you'll need to place the zip
# file provided in the same directory as this PKGBUILD in order to build
# this package.

pkgname=legendofdungeon
pkgver=Zombie
pkgrel=1
pkgdesc="A 4 Player Co-op Rogue-Like-like Beat'em'up with Dynamic Lighting on AWESOME Pixel Art."
group=("games")
arch=("x86_64")
url="http://www.robotloveskitty.com/LoD/"
license=('custom')
depends=(lib32-libxdmcp lib32-libxau lib32-libxrender lib32-libdrm
         lib32-libxxf86vm lib32-libxshmfence lib32-libxcb lib32-libx11
         lib32-libxfixes lib32-libxdamage lib32-mesa lib32-expat lib32-glibc
         lib32-gcc-libs lib32-glibc lib32-libxcursor lib32-libxext lib32-libx11
         lib32-mesa-libgl lib32-glu lib32-gcc-libs)
source=(LegendofDungeon-Linux.zip::https://manual-download-required)
md5sums=('4c1a3d87fcb70e3de677e517a3cdac3a')
PKGEXT=".pkg.tar"

package() {
  cd "$srcdir/LegendofDungeon-Linux"

  install -Dm 755 LegendofDungeon.x86 "${pkgdir}/opt/LegendofDungeon/LegendofDungeon"

  find LegendofDungeon_Data -type f -exec \
    install -Dm 644 {} "${pkgdir}/opt/LegendofDungeon/{}" \;

  install -d "${pkgdir}/usr/bin/"
  ln -s "/opt/LegendofDungeon/LegendofDungeon" "${pkgdir}/usr/bin/legendofdungeon"
}
