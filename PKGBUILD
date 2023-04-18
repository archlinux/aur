pkgname=netease-cloud-music-gtk-bin
_pkgver=2.2.0-40
pkgver=2.2.0
pkgrel=1
pkgdesc="Linux 平台下基于 Rust + GTK 开发的网易云音乐播放器"
arch=('x86_64')
url="https://github.com/gmg137/netease-cloud-music-gtk"
license=('GPL')
depends=(
	'libadwaita'
	'gst-plugins-base'
	'gst-plugins-good'
)
optdepends=(
	'gst-plugins-bad: extra media codecs'
	'gst-plugins-ugly: extra media codecs'
)
conflicts=('netease-cloud-music-gtk')
source=(
  "https://github.com/gmg137/netease-cloud-music-gtk/releases/download/${pkgver}/netease-cloud-music-gtk-${_pkgver}.1.x86_64.rpm"
  "https://github.com/gmg137/netease-cloud-music-gtk/releases/download/${pkgver}/netease-cloud-music-gtk-lang-${_pkgver}.1.noarch.rpm"
)
noextract=(
  "netease-cloud-music-gtk-${_pkgver}.1.x86_64.rpm"
  "netease-cloud-music-gtk-lang-${_pkgver}.1.noarch.rpm"
)
sha256sums=('694c820758044441bab86f177116747c39c5358a058d9e82e8eaea982ea3b8b1'
            '2a738d661b106c71a5fca46609ff208792e90a85f127dbacb4b3cc5c0bc88d55'
)
package() {
  cd "${srcdir}"
  bsdtar -xf "netease-cloud-music-gtk-${_pkgver}.1.x86_64.rpm" -C "${pkgdir}/"
  bsdtar -xf "netease-cloud-music-gtk-lang-${_pkgver}.1.noarch.rpm" -C "${pkgdir}/"
  sed -i 's/StartupWMClass=com.gitee.gmg137.NeteaseCloudMusicGtk4/StartupWMClass=netease-cloud-music-gtk4/' ${pkgdir}/usr/share/applications/com.gitee.gmg137.NeteaseCloudMusicGtk4.desktop
}
