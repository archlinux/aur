# Maintainer: Mészáros Zoltán <contact.mesonotes@gmail.com>
pkgname=mesonotes-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Notes, tasks, boards, canvases and writing on your own computer"
arch=('x86_64')
url="https://linuxmind.gitlab.io/"
license=('GPL-3.0-or-later')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'libnotify' 'at-spi2-core' 'xdg-utils' 'libsecret' 'util-linux-libs')
optdepends=('smbclient: backup and sync to a NAS (SMB share)')
provides=('mesonotes')
conflicts=('mesonotes')
options=('!strip' '!debug')
source=("mesonotes-${pkgver}-amd64.deb::https://gitlab.com/api/v4/projects/linuxmind%2Fmesonotes/packages/generic/mesonotes/${pkgver}/mesonotes-${pkgver}-amd64.deb")
sha256sums=('6b97247a7d53544e7a5f5a9aa8427d87b4f421fdaac5ac83375a77bd23867276')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir"
  install -d "$pkgdir/usr/bin"
  ln -s /opt/MesoNotes/mesonotes "$pkgdir/usr/bin/mesonotes"
}
