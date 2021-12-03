# Maintainer: Nobbele <realnobbele@gmail.com>
pkgname=unityhub-beta
pkgver=3.0.0-beta.6
pkgrel=1
pkgdesc="Unity Hub beta"
arch=('x86_64')
url="https://unity.com/"
license=('custom')
depends=('zlib')
source=(
  "$pkgname-$pkgver.tar.gz::https://public-cdn.cloud.unity3d.com/hub/prod/UnityHubBeta.tar.gz"
  "license.txt"
  "unityhub.desktop"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)
OPTIONS=(!strip)

build() {
  cd 'Unity Hub'

}

package() {
  cd 'Unity Hub'

  install -Dm755 UnityHub.AppImage "$pkgdir/opt/$pkgname/UnityHub.AppImage"

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/${pkgname}/UnityHub.AppImage" "$pkgdir/usr/bin/unityhub"

  install -Dm644 "$srcdir/unityhub.desktop" "$pkgdir/usr/share/applications/unityhub.desktop"
  install -Dm644 "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
  install -Dm644 "unityHub.png" "$pkgdir/usr/share/icons/unityHub.png"

  xdg-mime default unityhub.desktop x-scheme-handler/unityhub
}
