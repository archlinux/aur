# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=ytui-music-bin
pkgver=2.0.0b
_pkgver=2.0.0-beta
pkgrel=1
pkgdesc="Listen to music from youtube inside terminal with sleek tui"
arch=("x86_64")
url="https://github.com/sudipghimire533/ytui-music"
license=("GPL2")
depends=("mpv" "youtube-dl")
provides=(${pkgname%-bin})
source=("${url}/releases/download/v${_pkgver}/ytui_music-linux-amd64"
        "ytui-music.png")
sha256sums=('27c08cbf5f47a82f902eb7ee2e30103cd2b7de5515b1e774de18fbb0e8dd417c'
            '0427772c908fa26a3cfe20e01c9a22c80a63a5e0503907d861f1ba3396ea6505')
prepare() {
cat > ytui-music.desktop <<- EOF
[Desktop Entry]
Name=Ytui Music
Comment=Listen to music from youtube inside terminal with sleek tui
Exec=ytui-music run
Terminal=true
Icon=/usr/share/icons/ytui-music.png
Type=Application
StartupNotify=true
StartupWMClass=ytui-music
Categories=AudioVideo;Player;
EOF
}
package() {
  install -Dm755 ytui_music-linux-amd64 "$pkgdir/usr/bin/ytui-music"
  install -Dm755 ytui-music.png "$pkgdir/usr/share/icons/ytui-music.png"
  install -Dm755 ytui-music.desktop "$pkgdir/usr/share/applications/ytui-music.desktop"
}
