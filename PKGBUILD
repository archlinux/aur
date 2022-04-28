# Maintainer: Weihao Jiang <weihau.chiang#gmail.com>

pkgname=unityhub-cn
pkgver=3.1.1
pkgrel=1
pkgdesc="The Unity Hub is a standalone application that streamlines the way you find, download, and manage your Unity Projects and installations. (China localized version)"
url="https://unity.cn/"
arch=('x86_64')
license=('custom')
depends=('nss' 'gtk3')
optdepends=(
  'libappindicator-gtk3: The DEB says this an optional dependency'
  'gconf: Used by old editors'
  'cpio: used for Android build support'
)
source=(
  "$pkgname-$pkgver.deb::https://public-cdn.cloud.unitychina.cn/hub/prod/UnityHubSetup.deb"
  'license.txt'
)
sha256sums=('2953526a671543af613998d50808df204c5fbf70685564e208f36f663679d34a'
            'f0eb3a4bb148bb7f426e4f5b97e891265ac487710cbcba9282518537c7b5d833')
provides=('unityhub')
conflicts=('unityhub')

OPTIONS=(!strip)

package() {
  tar -xf 'data.tar.bz2' -C "$pkgdir/"
  mkdir -p "$pkgdir/usr/bin"
  ln -sf '/opt/unityhub/unityhub' "$pkgdir/usr/bin/unityhub"

  install -Dm644 "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
