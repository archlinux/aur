# Maintainer: Dave Blair <mail@dave-blair.de>

pkgname=spacefm-bin
pkgver=1.0.6
_subver=5
pkgrel=1
arch=('x86_64')
pkgdesc="SpaceFM binary package from debian bullseye, GTK3 version"
license=('GPL-2.0-only')
source=("http://ftp.de.debian.org/debian/pool/main/s/spacefm/spacefm-gtk3_${pkgver}-${_subver}+b1_amd64.deb")
depends=(gtk3 startup-notification ffmpegthumbnailer)
provides=('spacefm')
conflicts=('spacefm' 'spacefm-gtk2' 'spacefm-gtk2-bin')
sha256sums=('758a0197e8fa8862d97d51ce9734755269896fa67a46fb0b36d6831b25ca6bfd')
url="https://packages.debian.org/bookworm/amd64/spacefm-gtk3"

prepare() {
  bsdtar -xf 'data.tar.xz' -C ${srcdir}
}

package() {
  cp -a ${srcdir}/usr "${pkgdir}/"
  cp -a ${srcdir}/etc "${pkgdir}/"
}
