# Maintainer: Matthias Mailänder <matthias@mailaender.name>

pkgname=theia-bin
pkgver=1.61.1
pkgrel=1
pkgdesc="Cloud and Desktop IDE Platform"
arch=('x86_64')
url='https://www.theia-ide.org/'
license=('EPL2')
provides=('theia')
conflicts=('theia')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret' 'ripgrep' 'alsa-lib')
optdepends=('libappindicator-gtk3: Systray indicator')
source=("TheiaIDE_x64_${pkgver}.deb::https://www.eclipse.org/downloads/download.php?file=/theia/ide/${pkgver}/linux/TheiaIDE.deb&r=1")
sha256sums=('fb2e7fc453cd025b8c6a8d3031582994347b57e37b92903e62a239b85d69fc2d')
options=('!strip')

package() {
  tar -xJf data.tar.xz --no-same-owner -C "${pkgdir}"
  rm -f "${pkgdir}/usr/share/doc/theia-ide-electron-appchangelog.gz"

  # Replace included binary with system copy
  ln -sf /usr/bin/rg "${pkgdir}/opt/TheiaIDE/resources/app/lib/backend/native/rg"
}

