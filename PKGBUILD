# Maintainer: Pater Kleomenis <paterkleomenis@protonmail.com>
pkgname=connected-desktop-bin
_pkgname=connected-desktop
pkgver=3.2.9
pkgrel=1
pkgdesc="High-speed, offline, cross-platform ecosystem bridging devices (Binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/paterkleomenis/connected"
license=('MIT' 'Apache-2.0')
depends=('gtk3' 'webkit2gtk-4.1' 'libappindicator-gtk3' 'openssl' 'dbus')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")

source=("https://raw.githubusercontent.com/paterkleomenis/connected/main/packaging/connected-desktop.desktop"
        "https://raw.githubusercontent.com/paterkleomenis/connected/main/android/app/src/main/ic_launcher-playstore.png"
        "https://raw.githubusercontent.com/paterkleomenis/connected/main/LICENSE-MIT"
        "https://raw.githubusercontent.com/paterkleomenis/connected/main/LICENSE-APACHE")
source_x86_64=("connected-desktop-${pkgver}::https://github.com/paterkleomenis/connected/releases/download/${pkgver}/connected-desktop-linux-x86_64")
source_aarch64=("connected-desktop-${pkgver}::https://github.com/paterkleomenis/connected/releases/download/${pkgver}/connected-desktop-linux-aarch64")

sha256sums=('baf3b2e0d55d9fcb23630a7a6c0eff68eb9b708f8f0ce8e698dcf8ea611666ad'
            '89448ca4aa33837cea05777f33c93253145bb583b4a1e2f010bef666429e1899'
            'fdc5b45803bf8f5d4435509da25399414072b3d95badd6b09b2e84c2f1f198d5'
            '6bbe4ace8a1818f89b96dfdda9f9d4b9a178bc047c3dc2511a3d93d51f86d7ae')
sha256sums_x86_64=('038453c0f933399e06b1159925c8e41d97893ed3f8d7d6a3cb8430afd5072cb1')
sha256sums_aarch64=('e2523fb7ce1519297f10b541eab33672889f80af66ccbc44f17b64f3092787f1')


package() {
  install -Dm755 "connected-desktop-${pkgver}" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "connected-desktop.desktop" "$pkgdir/usr/share/applications/connected-desktop.desktop"
  install -Dm644 "ic_launcher-playstore.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/connected-desktop.png"
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE-MIT"
  install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE-APACHE"
}
