# Maintainer:  Seylerius <seylerius@seriouslyseylerius.com>
# Maintainer: Chris Höppner <me@mkaito.com>
pkgname=dfhack
_pkgver=0.42.06-r1
pkgver=0.42.06_r1
pkgrel=1
pkgdesc="A Dwarf Fortress memory access library and a set of basic tools that use it."
url="https://github.com/DFHack/dfhack"
arch=('i686' 'x86_64')
license=('custom')
depends=('dwarffortress=0.42.06')
if test "$CARCH" == "x86_64"; then
  depends+=(lib32-libpng12 lib32-libjpeg6)
fi
conflicts=(dfhack-git)
source=("$pkgname-$pkgver.tar.bz2::https://github.com/DFHack/dfhack/releases/download/0.42.06-r1/dfhack-0.42.06-r1-Linux-gcc-4.5.3.tar.bz2" "dwarffortress-hacked" "dfhack-run")
sha256sums=('16d320a6ea379270a203745953ea0303be307c748c6436df810e0f3a5d6f093f'
            '8d68139fb2cbb49a25999462974bff5c40ba23028c823fb666507fbc151ac52d'
            'f11870300ccd8908733c8869f93ae48b22130ee338412ffcae6f8228875db747')
package() {
  cd $srcdir
  mkdir -p $pkgdir/opt/dwarffortress
  cp -r hack stonesense dfhack dfhack-run dfhack.init-example $pkgdir/opt/dwarffortress
  cd ..
  install -Dm755 dwarffortress-hacked $pkgdir/usr/bin/dfhack
  install -Dm755 dfhack-run $pkgdir/usr/bin/dfhack-run
}
