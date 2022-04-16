# Maintainer: Chris Höppner <me@mkaito.com>
pkgname=armok-vision
pkgver=0.21.0
pkgrel=2
pkgdesc="A 3d realtime visualizer for Dwarf Fortress"
arch=('x86_64')
url="https://github.com/JapaMala/armok-vision"
license=('MIT')
depends=('dfhack>=0.40.24_r5' 'dwarffortress')
makedepends=('unzip' 'coreutils')
source=("$pkgname-$pkgver.zip::https://github.com/JapaMala/armok-vision/releases/download/v${pkgver}/Armok.Vision.${pkgver}.Linux.zip"
       "armok-vision")
sha512sums=('3c129b083a6d9dc1688dfa9ca5f3f0b9d86e789cc7d0597d4944d862140e895119d629bfa7aa09bd78a166edfddebf0964fc971d7836a6fb633c8b67eeb7962b'
            '2cc24e2342099cf4f540c56e097fb22332dade55e37b535b77c5efcd418fb92d203855f1f47d93f14e4d57df06cd49c39b9041a2b76c3c3593af94960ed59d15')
# Extracting conflicts with previous versions
noextract=("$pkgname-$pkgver.zip")

package() {
  mkdir -p "$pkgdir/opt/dwarffortress/armok-vision"
  unzip -q "$pkgname-$pkgver.zip" -d "$pkgdir/opt/dwarffortress/armok-vision/"
  chmod 755 "$pkgdir/opt/dwarffortress/armok-vision/Armok Vision Linux.x86_64"
  install -Dm755 armok-vision "$pkgdir/usr/bin/armok-vision"
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# sh-indentation: 2
# End:
