# Maintainer: Matthias Mailänder <matthias@mailaender.name>

pkgname=theia-bin
pkgver=1.67.100
pkgrel=1
pkgdesc="Cloud and Desktop IDE Platform"
arch=('x86_64')
url='https://www.theia-ide.org/'
license=('EPL-2.0')
provides=('theia')
conflicts=('theia')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret' 'ripgrep' 'alsa-lib')
optdepends=('libappindicator-gtk3: Systray indicator')
source=("TheiaIDE_x64_${pkgver}.deb::https://www.eclipse.org/downloads/download.php?file=/theia/ide/${pkgver}/linux/TheiaIDE.deb&r=1")
sha256sums=('f5fa898e58b49752c52cd24d9c161f15dbe04e1936a8ce2c8fa6430ea45468be')
options=('!strip')

package() {
  tar -xJf data.tar.xz --no-same-owner -C "${pkgdir}"
  rm -f "${pkgdir}/usr/share/doc/theia-ide-electron-appchangelog.gz"

  # Replace included binary with system copy
  ln -sf /usr/bin/rg "${pkgdir}/opt/TheiaIDE/resources/app/lib/backend/native/rg"
}

