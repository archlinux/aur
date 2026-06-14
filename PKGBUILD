pkgname='vrrtest'
pkgver=2.1.1
pkgrel=1
pkgdesc='A very small utility to test variable refresh rate.'
arch=(any)
url='https://github.com/Nixola/VRRTest'
license=('Zlib')
depends=('love')
source=(
  'https://github.com/Nixola/VRRTest/releases/download/v2.1.1/vrrTest_v2.1.1.love'
  'vrrtest'
  'vrrtest.desktop'
  'vrrtest.svg'
)
sha256sums=(
  'df73b1f6251208cabfb253ae061d6cc8d42826707715ca82708d9d6fc2147c3e'
  'efa397c76d369e6a7b51344b1303b77c9823979af6a1d6f070c35e409c393b2f'
  'e4535c94934b81c55ee0667b554909c1d489fe0693d7db73615c5916c32f9bc0'
  '89afa45b2fc870c55ccd750eee371bfcfe7837ccd3b45ef636c2f445efc2c046'
)

package() {
  mkdir -p "$pkgdir/usr/share/vrrtest"
  cp -r "$srcdir/vrrTest_v2.1.1.love" "$pkgdir/usr/share/vrrtest/vrrtest.love"

  install -Dm755 -t "$pkgdir/usr/bin" vrrtest

  install -D -m644 "$srcdir/vrrtest.desktop" "$pkgdir/usr/share/applications/vrrtest.desktop"
  install -D -m644 "$srcdir/vrrtest.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/vrrtest.svg"
}
