# Maintainer: ardahzr <ardahzr@github>
pkgname=lmp-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Spotify-inspired dark-theme GTK3 music player for Linux with YouTube & Spotify download"
arch=('x86_64')
url="https://github.com/ardahzr/linux-mp3-youtube"
license=('MIT')
depends=('libpulse' 'gtk3' 'yt-dlp' 'ffmpeg' 'python-mutagen')
optdepends=('libnotify: desktop notifications')
provides=('lmp')
conflicts=('lmp')
source=("MP3Player-linux-x64-${pkgver}::https://github.com/ardahzr/linux-mp3-youtube/releases/download/v${pkgver}/MP3Player-linux-x64")
sha256sums=('d79cfbb9c90ce300648625172779b55e2569a3907ce163467da3f727413ca85a')
options=('!strip')

package() {
    install -Dm755 "${srcdir}/MP3Player-linux-x64-${pkgver}" "${pkgdir}/usr/bin/lmp"

    # Desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/lmp.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=LMP – Libuntu Music Player
GenericName=Music Player
Comment=Spotify-inspired GTK3 music player with YouTube & Spotify download
Exec=lmp
Icon=audio-x-generic
Terminal=false
Categories=AudioVideo;Audio;Player;
Keywords=music;mp3;player;youtube;spotify;
StartupNotify=true
EOF
}
