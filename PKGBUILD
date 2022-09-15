# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: mstmob

_pkgname=cura
pkgname=$_pkgname-bin
pkgver=5.1.1
pkgrel=1
pkgdesc='State-of-the-art slicer app to prepare your 3D models for your 3D printer'
url='https://ultimaker.com/software/ultimaker-cura'
license=('LGPL3')
arch=('x86_64')
depends=('fuse2' 'xdg-desktop-portal' 'xdg-desktop-portal-gtk')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')

source=(
  "https://github.com/Ultimaker/Cura/releases/download/${pkgver}/Ultimaker-Cura-${pkgver}-linux-modern.AppImage"
  "$_pkgname.desktop"
  "$_pkgname.png"
)

sha512sums=(
  '5c0a56f5256064cf18b005745a0ced07473b3603e4fa738ce3ea2e015e2f0d585c123956b8ec179cfdc160da90369dec4645c713a6246efabd20452766dd70e2'
  '444c1ea35647f0e2ef89c8ef95a60097b2bb2c16c1f498859c258b06abf3a6990b855df3108ba32268cfca8b87818e933c641de5f1cab03534053a8d4129e192'
  '37ecd96cd13ec262ba618d14af83d7a10769e9db736ebf1536c2570d5c2dbd7e4f4d6db4e0de13894f23255dd68f15fd7e5ba388798659c9745933c8d1c5ed99'
)

package() {
  install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 $_pkgname.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm755 Ultimaker-Cura-${pkgver}-linux-modern.AppImage "$pkgdir/usr/bin/$_pkgname"
}
