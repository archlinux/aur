# Maintainer: Midoo <ahmedmoselhi55@gmail.com>

pkgname=xdman8
_pkgname=xdman
pkgver=8.0.25
pkgrel=2
pkgdesc="Open source download accelerator and video downloader."
arch=(x86_64)
url=https://xtremedownloadmanager.com
license=(GPL3)
depends=(ffmpeg 'gtk3>=3.22.0' hicolor-icon-theme)
provides=("$pkgname")
conflicts=("$_pkgname" "xdman8-beta-git")
replaces=("$_pkgname")
source=("$pkgname"::"https://github.com/subhra74/xdm-experimental-binaries/releases/download/"$pkgver"-beta/xdman_gtk_"$pkgver"_amd64.deb")
sha256sums=('a49e65a57c5e9fad8d7e4d56fe783daec68f2887c3b424a32cfac5695315b198')

prepare() {
    bsdtar -xf data.tar.xz
}

package() {
  install -dm 755 "$pkgdir"/{opt/"$_pkgname",usr/share/applications}
  cp -a "/${srcdir}/opt/xdman" "${pkgdir}/opt"
  install -Dm644 "/${srcdir}/usr/share/applications/xdm-app.desktop" "${pkgdir}/usr/share/applications/xdm-app.desktop"
}
