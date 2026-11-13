# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=kibo-appimage
pkgver=1.3.1
pkgrel=1
pkgdesc="Kibo Anime - Application for watching anime (AppImage)"
url="https://kiboanime.app"
arch=("x86_64")
depends=("fuse2")
provides=("kibo")
conflicts=("kibo")
options=("!strip")
license=("custom")

source=("kibo-appimage-${pkgver}.AppImage::https://apk.kiboanime.app/downloadpc/Kibo-${pkgver}.AppImage" "kibo.svg::https://www.kiboanime.app/group-2.svg" "kibo.desktop::https://raw.githubusercontent.com/Cleboost/missing-aur/main/packages/kibo/kibo.desktop")
sha256sums=('56463336613ee48080de73a961c015db9d534920e992c17651bc3e1ca841da30'
            '61fbfba68ca25f9f1297c9152f324063b771c08631f10574371d0677c880d393'
            '3f3472b09fa34c77f238efa75ea8da528c969ef67e7ec062699f97f5c90533aa')

prepare() {
  chmod +x "${srcdir}/kibo-appimage-${pkgver}.AppImage"
}

package() {
  install -Dm755 "${srcdir}/kibo-appimage-${pkgver}.AppImage" "${pkgdir}/opt/kibo-appimage/kibo.AppImage"
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/kibo-appimage/kibo.AppImage" "${pkgdir}/usr/bin/kibo"
  install -Dm644 "${srcdir}/kibo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/kibo.svg"
  install -Dm644 "${srcdir}/kibo.desktop" "${pkgdir}/usr/share/applications/kibo.desktop"
}

