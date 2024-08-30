# Maintainer: Matthias Mailänder <matthias@mailaender.name>

pkgname=theia-bin
pkgver=1.52.0
pkgrel=1
pkgdesc="Cloud and Desktop IDE Platform"
arch=('x86_64')
url='https://www.theia-ide.org/'
license=('EPL2')
provides=('theia')
conflicts=('theia')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: Systray indicator')
source=("TheiaIDE_x64_${pkgver}.deb::https://www.eclipse.org/downloads/download.php?file=/theia/ide/${pkgver}/linux/TheiaIDE.deb&r=1")
sha256sums=('99ffeee23a18b69aafddc3ee6a6b8ffb360c0254cd0cf6c79c996a0b8ed67841')
options=('!strip')

package() {
  tar -xJf data.tar.xz --no-same-owner -C "${pkgdir}"

  mkdir -p "${pkgdir}/usr/share/icons/hicolor/512x512/apps/"
  mv "${pkgdir}/usr/share/icons/hicolor/0x0/apps/theia-ide-electron-app.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/theia-ide-electron-app.png"

  rm -f "${pkgdir}/usr/share/doc/theia-ide-electron-appchangelog.gz"
}

