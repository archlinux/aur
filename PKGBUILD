# Maintainer: Chris Höppner <me@mkaito.com>
pkgname=armok-vision
pkgver=0.20.2
pkgrel=1
pkgdesc="A 3d realtime visualizer for Dwarf Fortress"
arch=('x86_64')
url="https://github.com/JapaMala/armok-vision"
license=('MIT')
depends=('dfhack>=0.40.24_r5' 'dwarffortress')
source=("$pkgname-$pkgver.zip::https://github.com/JapaMala/armok-vision/releases/download/v${pkgver}/Armok.Vision.${pkgver}.Linux.zip"
       "armok-vision")
sha512sums=('d41a8c858b50fd0a4e47c5ae83bd531619afdaa5cedd221735b1b0f71875cadb51f0772754d348afeaede27a5c1cfd33c162c84f6bce9c96bf32535093699782'
            '2cc24e2342099cf4f540c56e097fb22332dade55e37b535b77c5efcd418fb92d203855f1f47d93f14e4d57df06cd49c39b9041a2b76c3c3593af94960ed59d15')

package() {
  cd ${srcdir}
  mkdir -p $pkgdir/opt/dwarffortress/armok-vision
  cp -r ${srcdir}/Armok\ Vision\ Linux_Data/ $pkgdir/opt/dwarffortress/armok-vision/
  install -Dm755 "Armok Vision Linux.x86_64" "$pkgdir/opt/dwarffortress/armok-vision/Armok Vision Linux.x86_64"
  install -Dm755 armok-vision $pkgdir/usr/bin/armok-vision
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# sh-indentation: 2
# End:
