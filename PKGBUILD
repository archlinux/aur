# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=cura
pkgname=$_pkgname-bin
pkgver=5.1.0
pkgrel=2
pkgdesc='State-of-the-art slicer app to prepare your 3D models for your 3D printer'
url='https://ultimaker.com/software/ultimaker-cura'
license=('LGPL3')
arch=('x86_64')
depends=('fuse2' 'zlib')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')

source=(
  "https://github.com/Ultimaker/Cura/releases/download/${pkgver}/Ultimaker-Cura-${pkgver}-linux-modern.AppImage"
  "$_pkgname.desktop"
  "$_pkgname.png"
)

sha512sums=(
  'aa4590c30ffd76fc51ab7343a461db4290f4c1481bda46a27780a86988214d1366bf32049fa838b72c838b6e5915838938163e481d7f21fa0d790daf86acc49b'
  '444c1ea35647f0e2ef89c8ef95a60097b2bb2c16c1f498859c258b06abf3a6990b855df3108ba32268cfca8b87818e933c641de5f1cab03534053a8d4129e192'
  '37ecd96cd13ec262ba618d14af83d7a10769e9db736ebf1536c2570d5c2dbd7e4f4d6db4e0de13894f23255dd68f15fd7e5ba388798659c9745933c8d1c5ed99'
)

package() {
  install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 $_pkgname.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm755 Ultimaker-Cura-${pkgver}-linux-modern.AppImage "$pkgdir/usr/bin/$_pkgname"
}
