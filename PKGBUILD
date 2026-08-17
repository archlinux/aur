# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=kibo-appimage
pkgver=1.1.8
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
sha256sums=('a3532c17a6b52797d762fff692dbff1d0c85fd9f76f223b41172e15e3840db6b'
            'bbe7aef71d090ed5eabc7b2933431990ce8e5253ea3123d3695cd2264434bbd6'
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

