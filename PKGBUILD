# Maintainer: Ali Rohman <laymoth@pm.me>

pkgname=hidamari
pkgver=3.2
_pkgver=3.2
pkgrel=2
pkgdesc='Video wallpaper for Linux. Written in Python.'
arch=('any')
url='https://github.com/jeffshee/hidamari'
license=('GPL3')
depends=('python-gobject' 'python-pillow' 'python-pydbus' 'python-vlc' 'yt-dlp' 'dconf' 'python-requests' 'gnome-desktop-4' 'libwnck3' 'python-setproctitle' 'mesa-utils' 'webkit2gtk')
makedepends=('git' 'meson' 'gtk-update-icon-cache' 'desktop-file-utils')
optdepends=('vdpauinfo: Query and display VDPAU capabilities'
            'libappindicator-gtk3: tray icon support')
source=("git+https://github.com/jeffshee/hidamari.git#tag=v${_pkgver}")
sha256sums=('SKIP')

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
