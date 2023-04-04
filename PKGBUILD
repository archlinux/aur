# Maintainer: Ali Rohman <laymoth@pm.me>

pkgname=hidamari
pkgver=3.3
_pkgver=3.3
pkgrel=1
pkgdesc='Video wallpaper for Linux. Written in Python.'
arch=('any')
url='https://github.com/jeffshee/hidamari'
license=('GPL3')
depends=('python-gobject' 'python-pillow' 'python-pydbus' 'python-vlc' 'yt-dlp' 'dconf' 'python-requests' 'gnome-desktop-4' 'libwnck3' 'python-setproctitle' 'mesa-utils' 'webkit2gtk' 'xdg-user-dirs' 'vdpauinfo' 'libappindicator-gtk3')
makedepends=('git' 'meson' 'gtk-update-icon-cache' 'desktop-file-utils')
source=("git+https://github.com/jeffshee/hidamari.git#tag=v${_pkgver}")
sha256sums=('SKIP')

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
