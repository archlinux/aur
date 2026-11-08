# Maintainer: Mészáros Zoltán <contact.mesonotes@gmail.com>
pkgname=mesonotes-bin
pkgver=1.0.51
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
sha256sums=('8b429106478d1db6714e4a3d0a31a779a66d672ab254796c7257d7af918e942c')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir"
  install -d "$pkgdir/usr/bin"
  ln -s /opt/MesoNotes/mesonotes "$pkgdir/usr/bin/mesonotes"
}
