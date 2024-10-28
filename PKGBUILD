# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=qdiskinfo-bin
pkgver=0.3
pkgrel=1
pkgdesc="Frontend for smartctl providing a user experience similar to CrystalDiskInfo (binary release)"
url="https://github.com/edisionnano/QDiskInfo"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('hicolor-icon-theme' 'polkit' 'qt6-base' 'qt6-svg' 'smartmontools')
provides=("qdiskinfo")
conflicts=("qdiskinfo")
source=("$url/releases/download/$pkgver/QDiskInfo-Qt6-libc"
        "$url/raw/refs/tags/$pkgver/dist/QDiskInfo.desktop"
        "$url/raw/refs/tags/$pkgver/dist/QDiskInfo.svg"
        "$url/raw/fc9a25551ad4380d6dce988c0513e85b5fa2fd71/dist/QDiskInfo.png")
sha256sums=('d0172cb70dec29c8b82e7c9317be0c7e2809a4c9e5711095fd34ba0d756c82cd'
            '0c5a2436b6777f7871466d85dcc4ce880b597ec112c79991c9cf6a59a428895b'
            'f7232af27f88d2ca36c46abebc272976b8e9aa91c7b00c1ae6635c53f09746c6'
            '7c237bd42f38cd224b9d2fe2d09c6c1539bc52cd92cecf25a270cf0f52a18a33')

prepare() {
  sed -i -E "s|Icon=QDiskInfo|Icon=qdiskinfo|g" QDiskInfo.desktop
  sed -i -E "s|Exec=QDiskInfo|Exec=qdiskinfo|g" QDiskInfo.desktop
}

package() {
  install -Dm644 QDiskInfo.desktop "$pkgdir/usr/share/applications/qdiskinfo.desktop"
  install -Dm644 QDiskInfo.png "$pkgdir/usr/share/icons/hicolor/scalable/apps/qdiskinfo.png"
  install -Dm644 QDiskInfo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/qdiskinfo.svg"
  install -Dm755 QDiskInfo-Qt6-libc "$pkgdir/usr/bin/qdiskinfo"
}
