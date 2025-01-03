# Maintainer: Thomas Wearmouth <tomwmth at pm dot me>
pkgname=eontimer-bin
_gitname=EonTimer
pkgver=3.0.0rc.6
_gitver=3.0.0-rc.6
pkgrel=1
pkgdesc='Pokémon RNG Timer'
arch=('x86_64')
url="https://github.com/DasAmpharos/$_gitname"
license=('MIT')
conflicts=('eontimer-git')
options=('!debug')

source=(
    "$pkgname-$pkgver.zip::https://github.com/DasAmpharos/$_gitname/releases/download/$_gitver/$_gitname-ubuntu.zip"
    "$pkgname-$pkgver.png::https://raw.githubusercontent.com/DasAmpharos/EonTimer/9449e6158f0aa6eaa24b3b1d0a427aa198b5c0e4/eon_timer/resources/icon-512.png"
    "$pkgname-$pkgver-LICENSE.md::https://raw.githubusercontent.com/DasAmpharos/EonTimer/9449e6158f0aa6eaa24b3b1d0a427aa198b5c0e4/LICENSE.md"
)
sha256sums=(
    'cf4b3bccd0cc1f8d1b7a64f7e4b2e148a8507e3a5e6009dfa3dfe1da224bb193'
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
    install -Dm644 "$pkgname-$pkgver.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/eontimer.png"
    install -Dm644 "$pkgname-$pkgver-LICENSE.md" "$pkgdir/usr/share/licenses/eontimer/LICENSE.md"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/eontimer.desktop"
}
