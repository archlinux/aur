# Maintainer: kaptoxic
# Co-Maintianer: Sebastian Riedel <archlinux(at)basxto(dot)de>
# Contributor: Vincent Debarre <vinilox@vinilox.eu>

pkgname=battlejump
pkgver=0.12.0
pkgrel=10
pkgdesc="Arcade game inspired by Monster Farm Jump."
[ "$CARCH" = "i686"   ] && ARCH=x86 && ARCHMD5="264e973bf5ca043c83ecb85dab5b1386"
[ "$CARCH" = "x86_64" ] && ARCH=x64 && ARCHMD5="4c8c3b0dab9d9b9295b5134dc2c79944"
arch=('i686' 'x86_64')
url="http://www.battlejump.com" 
license=("cc-by-nc-sa")
depends=('sdl' 'sdl_mixer' 'sdl_image' 'sdl_ttf' 'curl' 'java-runtime' 'libcurl-compat')
source=(http://www.battlejump.com/Download/Battle_Jump_v0122_Linux_${ARCH}.tar.gz battlejump.desktop battlejumplauncher.desktop battlejump.sh)
md5sums=("${ARCHMD5}"
         'b6966061a4f38179ffa0f20ca605348f'
         'f10f4d87f398ab1fbdf57d0c9b84e619'
         'ce06f699c2cc5884a9595ccffedfafad')

package() { 
  cd ${srcdir}/BattleJump
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/{battlejump,applications}
  cp -R * ${pkgdir}/usr/share/battlejump 
  chmod 755 -R ${pkgdir}/usr/share/battlejump
  install ${srcdir}/battlejump.sh ${pkgdir}/usr/bin/battlejump
  chmod 777 ${pkgdir}/usr/share/battlejump/Data/*dat
  install ${srcdir}/*.desktop ${pkgdir}/usr/share/applications
}
