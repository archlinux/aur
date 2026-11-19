# Maintainer: Matthias Mailänder <matthias@mailaender.name>

pkgname=theia-bin
pkgver=1.77.0
pkgrel=1
pkgdesc="Cloud and Desktop IDE Platform"
arch=('x86_64')
url='https://www.theia-ide.org/'
license=('EPL-2.0')
provides=('theia')
conflicts=('theia')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret' 'alsa-lib')
optdepends=('libappindicator-gtk3: Systray indicator')
source=("TheiaIDE_x64_${pkgver}.deb::https://download.eclipse.org/theia/ide/${pkgver}/linux/TheiaIDE.deb")
sha256sums=('62f23c9e5befb9b6ce8b804e96d87736c053e20703848f48039b1a2192137fbc')
options=('!strip')

package() {
  tar -xJf data.tar.xz --no-same-owner -C "${pkgdir}"
  rm -f "${pkgdir}/usr/share/doc/theia-ide-electron-appchangelog.gz"
}

