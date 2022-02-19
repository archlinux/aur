# Maintainer: Marius Glo <marius@mgl.dev>
# Maintainer: Nobbele <realnobbele@gmail.com>
# Contributor: Oscar Morante <oscar@mooistudios.com>

pkgname=unityhub
pkgver=3.0.2
pkgrel=2
pkgdesc="The Unity Hub is a standalone application that streamlines the way you find, download, and manage your Unity Projects and installations."
url="https://unity.com/"
arch=('x86_64')
license=('custom')
depends=('nss' 'gtk3')
optdepends=(
  'libappindicator-gtk3: The DEB says this an optional dependency'
  'gconf: Used by old editors'
  'cpio: used for Android build support'
)
source=(
  "$pkgname-$pkgver.deb::https://hub.unity3d.com/linux/repos/deb/pool/main/u/unity/unityhub_amd64/unityhub-amd64-3.0.1.deb"
  'license.txt'
)
sha256sums=(
  '2c07bd472755b5eb544a0f89a528c7237c502daed4b56f6371611442cc4b3c0f'
  'f0eb3a4bb148bb7f426e4f5b97e891265ac487710cbcba9282518537c7b5d833'
)
OPTIONS=(!strip)

package() {
  tar -xf 'data.tar.bz2' -C "$pkgdir/"
  mkdir -p "$pkgdir/usr/bin"
  ln -sf '/opt/unityhub/unityhub' "$pkgdir/usr/bin/unityhub"

  install -Dm644 "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
