# Maintainer: Midoo <ahmedmoselhi55@gmail.com>

pkgname=xdman8-beta-git
_pkgname=xdman
pkgver=8.0.18
pkgrel=2
pkgdesc="Open source download accelerator and video downloader."
arch=(x86_64)
url=https://xtremedownloadmanager.com
license=(GPL3)
depends=(ffmpeg 'gtk3>=3.22.0' hicolor-icon-theme)
provides=("$pkgname")
conflicts=("$_pkgname")
replaces=("$_pkgname")
source=("$pkgname"::"https://github.com/subhra74/xdm-experimental-binaries/releases/download/"$pkgver"-beta/xdman_gtk_"$pkgver"_amd64.deb")
sha256sums=('b09a99268809f550010eea067a6bf40286d0a440581db59a8af2f2b53c030ef9')

prepare() {
    bsdtar -xf data.tar.xz
}

package() {
  install -dm 755 "$pkgdir"/{opt/"$_pkgname",usr/share/applications}
  cp -a "/${srcdir}/opt/xdman" "${pkgdir}/opt"
  install -Dm644 "/${srcdir}/usr/share/applications/xdm-app.desktop" "${pkgdir}/usr/share/applications/xdm-app.desktop"
}