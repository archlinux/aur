# Maintainer: Matthias Mailänder <matthias@mailaender.name>

pkgname=theia-bin
pkgver=1.60.200
pkgrel=2
pkgdesc="Cloud and Desktop IDE Platform"
arch=('x86_64')
url='https://www.theia-ide.org/'
license=('EPL2')
provides=('theia')
conflicts=('theia')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret' 'ripgrep')
optdepends=('libappindicator-gtk3: Systray indicator')
source=("TheiaIDE_x64_${pkgver}.deb::https://www.eclipse.org/downloads/download.php?file=/theia/ide/${pkgver}/linux/TheiaIDE.deb&r=1")
sha256sums=('54c689a6f4241e5a9e979e1afd1234ee4075e0b0672c2198b79666ae858ea537')
options=('!strip')

package() {
  tar -xJf data.tar.xz --no-same-owner -C "${pkgdir}"
  rm -f "${pkgdir}/usr/share/doc/theia-ide-electron-appchangelog.gz"

  # Replace included binary with system copy
  ln -sf /usr/bin/rg "${pkgdir}/opt/TheiaIDE/resources/app/lib/backend/native/rg"
}

