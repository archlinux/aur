# Maintainer: INeedTogepi
# Contributor: Thomas Wearmouth <tomwmth at pm dot me>
pkgname=eontimer-bin
_gitname=EonTimer
pkgver=3.0.0rc.8
_gitver=3.0.0-rc.8
pkgrel=1
pkgdesc='Pokémon RNG Timer'
arch=('x86_64')
url="https://github.com/DasAmpharos/$_gitname"
license=('MIT')
conflicts=('eontimer-git')
options=('!debug')

source=(
    "$pkgname-$pkgver.zip::https://github.com/DasAmpharos/$_gitname/releases/download/$_gitver/$_gitname-ubuntu.zip"
    "$pkgname-$pkgver.svg::https://raw.githubusercontent.com/DasAmpharos/EonTimer/1685c97c8401a514b6e2b4e6a2c58d7d69d26ff9/public/icon-512.svg"
    "$pkgname-$pkgver-LICENSE.md::https://raw.githubusercontent.com/DasAmpharos/EonTimer/33690944e6d33f860a07d9d2a3f133adcf6aea3f/LICENSE.md"
)
sha256sums=(
    '46005b2dd006e7eece39e5f41963540d2bf4141e3e541f02f905e96bbf817dc5'
    'SKIP'
    'SKIP'
)

prepare() {
    cat > "$srcdir/$pkgname.desktop" << EOF
[Desktop Entry]
Version=$_gitver
Type=Application
Name=$_gitname
Comment=Pokémon RNG Timer
Exec=/usr/bin/eontimer
Icon=eontimer
Terminal=false
Categories=Utility;
Keywords=eon;timer;
EOF
}

package() {
    install -Dm755 $_gitname "$pkgdir/usr/bin/eontimer"
    install -Dm644 "$pkgname-$pkgver.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/eontimer.svg"
    install -Dm644 "$pkgname-$pkgver-LICENSE.md" "$pkgdir/usr/share/licenses/eontimer/LICENSE.md"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/eontimer.desktop"
}
