# Maintainer: Dave Blair <mail@dave-blair.de>

pkgname=spacefm-gtk2-bin
pkgver=1.0.6
_subver=5
pkgrel=1
arch=('x86_64')
pkgdesc="SpaceFM binary package from debian bullseye, GTK2 version"
license=('GPL-2.0-only')
source=("http://ftp.de.debian.org/debian/pool/main/s/spacefm/spacefm_${pkgver}-${_subver}_amd64.deb")
depends=(gtk2 startup-notification ffmpegthumbnailer)
provides=('spacefm')
conflicts=('spacefm' 'spacefm-gtk2' 'spacefm-gtk3-bin')
sha256sums=('86ff5d420fd75ab032029760d25969060f8c8dfc584f664308e2862cad2c936a')
url="https://packages.debian.org/bookworm/amd64/spacefm"

prepare() {
  bsdtar -xf 'data.tar.xz' -C ${srcdir}
}

package() {
  cp -a ${srcdir}/usr "${pkgdir}/"
  cp -a ${srcdir}/etc "${pkgdir}/"
}
