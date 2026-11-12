# Maintainer: Mészáros Zoltán <contact.mesonotes@gmail.com>
pkgname=mesonotes-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A hobby notes app built on one principle: your data is your property"
arch=('x86_64')
url="https://linuxmind.gitlab.io/"
license=('GPL-3.0-or-later')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'libnotify' 'at-spi2-core' 'xdg-utils' 'libsecret' 'util-linux-libs')
optdepends=('smbclient: backup and sync to a NAS (SMB share)')
provides=('mesonotes')
conflicts=('mesonotes')
options=('!strip' '!debug')
source=("mesonotes-${pkgver}-amd64.deb::https://gitlab.com/api/v4/projects/linuxmind%2Fmesonotes/packages/generic/mesonotes/${pkgver}/mesonotes-${pkgver}-amd64.deb")
sha256sums=('8ebbbc62b35fb26c82c349c6a97e90c4a5b9b20fc01d9883ade0bfeb19406100')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir"
  install -d "$pkgdir/usr/bin"
  ln -s /opt/MesoNotes/mesonotes "$pkgdir/usr/bin/mesonotes"
}
