# Maintainer: Aixiao <aixiaoo@outlook.com>
pkgname=skillsplusplus-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="Skills 安装与管理工具 — 汇总全网 skills、一键安装（预编译）"
arch=('x86_64')
url="https://github.com/cpcc/SkillsPlusPlus"
license=('custom:none')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/skills++-v${pkgver}-Linux-x86_64.deb")
sha256sums=('847ac93bee14b0044d0f7da02059acd05244bee9cca873ef40ed65addb9ccb78')
options=('!debug')

package() {
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${srcdir}"

  install -Dm755 "${srcdir}/usr/bin/desktop" "${pkgdir}/usr/bin/skillsplusplus"

  install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/apps/desktop.png" \
    "${pkgdir}/usr/share/pixmaps/skillsplusplus.png"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/skillsplusplus.desktop" <<EOF
[Desktop Entry]
Name=skills++
Comment=Skills 安装与管理工具
Exec=skillsplusplus
Icon=skillsplusplus
Type=Application
Categories=Utility;
Terminal=false
EOF
}
