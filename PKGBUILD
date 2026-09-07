pkgname=youtuibe-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Prebuilt youTUIbe: a Ratatui frontend for yt-dlp'
arch=('x86_64')
url='https://github.com/sambuaneesh/youTUIbe'
license=('MIT')
depends=('yt-dlp' 'ffmpeg')
optdepends=('mpv: complete audio and video playback'
            'viu: full-terminal true-color artwork preview'
            'ffmpegthumbnailer: desktop thumbnails for source-quality Opus files'
            'aria2: optional accelerated downloading'
            'libnotify: desktop notifications'
            'xorg-xrandr: active display detection outside Hyprland')
provides=('youtuibe')
conflicts=('youtuibe')
_archive="youtuibe-${pkgver}-x86_64-unknown-linux-gnu"
source=("${_archive}.tar.gz::https://github.com/sambuaneesh/youTUIbe/releases/download/v${pkgver}/${_archive}.tar.gz")
sha256sums=('1bc77d3fa8f50a4a038a0bc003e867884bd943287483c8581f0ca0000c19ba6d')

package() {
  cd "${_archive}"
  install -Dm755 youtuibe "${pkgdir}/usr/bin/youtuibe"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/youtuibe/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/youtuibe/README.md"
  install -Dm644 packaging/youtuibe.desktop "${pkgdir}/usr/share/applications/youtuibe.desktop"
  install -Dm644 packaging/youtuibe.1 "${pkgdir}/usr/share/man/man1/youtuibe.1"
}
