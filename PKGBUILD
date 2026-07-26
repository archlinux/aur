# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=gearlever-bin
pkgver=4.6.2
pkgrel=3
pkgdesc="Manage AppImages with ease (prebuilt)"
arch=('any')
url="https://gearlever.mijorus.it"
license=('GPL-3.0-or-later')
# dwarfs is only needed for AppImages using a DwarFS filesystem, but a hard
# dependency: without dwarfsck Gear Lever cannot tell those apart from squashfs
# images and fails on them with a confusing "Can't find a valid SQUASHFS
# superblock" from its unsquashfs fallback.
depends=('gtk4' 'libadwaita' 'glib2' 'dconf' 'hicolor-icon-theme' 'python'
         'python-gobject' 'python-dbus' 'python-requests' 'python-pyxdg'
         '7zip' 'binutils' 'squashfs-tools' 'dwarfs' 'fuse2')
optdepends=('libxml2-legacy: required by the LibreOffice AppImage')
provides=('gearlever')
conflicts=('gearlever')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.zst::https://github.com/Felitendo/PKGBUILDS/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.zst")
sha256sums=('225dd08d1fbdf33bb5979660737cee180f60b8cfa6477f1553025a6c2f5236a5')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
