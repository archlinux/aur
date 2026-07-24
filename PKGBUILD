# Maintainer: Matthias Mailänder <matthias@mailaender.name>

pkgname=theia-bin
pkgver=1.73.100
pkgrel=1
pkgdesc="Cloud and Desktop IDE Platform"
arch=('x86_64')
url='https://www.theia-ide.org/'
license=('EPL-2.0')
provides=('theia')
conflicts=('theia')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret' 'alsa-lib')
optdepends=('libappindicator-gtk3: Systray indicator')
source=("TheiaIDE_x64_${pkgver}.deb::https://www.eclipse.org/downloads/download.php?file=/theia/ide/${pkgver}/linux/TheiaIDE.deb&r=1")
sha256sums=('6f4f87e35c891f595e453afcae3566ebb8a3be4e378a4ee7172d34ab0033bec2')
options=('!strip')

package() {
  tar -xJf data.tar.xz --no-same-owner -C "${pkgdir}"
  rm -f "${pkgdir}/usr/share/doc/theia-ide-electron-appchangelog.gz"
}

