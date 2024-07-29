# Maintainer: Andrei Embarque <andreijosee@zoho.com>
# Submitter: Ali Rohman <laymoth@pm.me>

pkgname='hidamari'
pkgver=3.5
pkgrel=2
pkgdesc='Video wallpaper for Linux. Written in Python.'
arch=(any)
url='https://github.com/jeffshee/hidamari'
license=('GPL-3.0-only')
depends=('python-gobject' 'python-pillow' 'python-pydbus' 'python-vlc' 'yt-dlp' 'dconf' 'python-requests' 'gnome-desktop-4' 'libwnck3' 'python-setproctitle' 'mesa-utils' 'webkit2gtk' 'xdg-user-dirs' 'vdpauinfo' 'libappindicator-gtk3' 'webkit2gtk-4.1')
makedepends=('git' 'meson' 'gtk-update-icon-cache' 'desktop-file-utils')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/refs/tags/v$pkgver-$pkgrel.tar.gz")
sha256sums=('60e9d52ebf578af91e20f5650c0829ab9c3c3b8405917584fd97595d2a48872a')

build() {
	arch-meson "$pkgname-$pkgver-$pkgrel" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
