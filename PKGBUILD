pkgname=youtuibe-bin
pkgver=0.2.0
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
sha256sums=('4625e690fd73baa2732e554779b8e1539f6a4ad5657793b374cf3bdd68c39f90')

package() {
  cd "${_archive}"
  install -Dm755 youtuibe "${pkgdir}/usr/bin/youtuibe"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/youtuibe/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/youtuibe/README.md"
  install -Dm644 packaging/youtuibe.desktop "${pkgdir}/usr/share/applications/youtuibe.desktop"
  install -Dm644 packaging/youtuibe.1 "${pkgdir}/usr/share/man/man1/youtuibe.1"
}
