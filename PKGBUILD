# Maintainer: mistiru <dev at mistiru dot me>
# Previous Maintainer: Julian Flake <flake at uni-koblenz dot de>
# Previous Maintainer: Thomas Jost <schnouki at schnouki dot net>

pkgname=pia-bin
pkgver=3.0.3
pkgrel=1
pkgdesc="A tool that aims to help data controllers build and demonstrate compliance to the GDPR. Developped by the French CNIL."
arch=('x86_64')
url="https://github.com/LINCnil/pia"
license=('GPL')
depends=('fuse' 'zlib')
options=('!strip')
source=("https://github.com/LINCnil/pia/releases/download/v${pkgver}/PIA-${pkgver}.AppImage"
        'pia-bin.png::https://github.com/LINCnil/pia/raw/master/src/assets/images/android-chrome-256x256.png'
        'pia-bin.desktop'
        'https://raw.githubusercontent.com/LINCnil/pia/master/LICENSE')
sha256sums=('b9b519f4921b120bcb08645e6da597c7a0589c358f4cbf4beb26a8305e37f0f4'
            'c69048d3e53950378fa716b8845beab746323be33f480708067b13b53d78f7d8'
            'ddf3ff71ceb6be91af9b1856e593fa9bcba05d575beb20d1946d63dd7df51c9e'
            'c05b0b2ce84cbc6457148985e2b065be862a441db1788bb036501ac8a741d1e7')

package() {
  cd "$srcdir"

  install -Dm644 pia-bin.desktop "$pkgdir/usr/share/applications/pia-bin.desktop"
  install -Dm644 pia-bin.png "$pkgdir/usr/share/pixmaps/pia-bin.png"
  install -Dm755 "PIA-${pkgver}.AppImage" "$pkgdir/usr/bin/PIA"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/pia-bin/LICENSE"
}
