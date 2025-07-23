# Maintainer: Dave Blair <mail@dave-blair.de>

pkgname=spacefm-gtk2-bin
pkgver=1.0.6
_subver=5
pkgrel=2
arch=('x86_64')
pkgdesc="SpaceFM binary package from debian bullseye, GTK2 version"
license=('GPL-2.0-only')
source=("http://ftp.de.debian.org/debian/pool/main/s/spacefm/spacefm_${pkgver}-${_subver}_amd64.deb"
        "https://www.dave-blair.de/projects/ui-assets.tar.gz")
depends=(gtk3 startup-notification ffmpegthumbnailer)
provides=('spacefm')
conflicts=('spacefm' 'spacefm-gtk3' 'spacefm-gtk3-bin')
sha256sums=('86ff5d420fd75ab032029760d25969060f8c8dfc584f664308e2862cad2c936a'
            '8500677665655a1a5d472ca1e1c36cb76b027d075f8f690b403503ebcaad1c32')
url="https://packages.debian.org/bookworm/amd64/spacefm"

prepare() {
  bsdtar -xf 'data.tar.xz' -C ${srcdir}
  bsdtar -xf 'ui-assets.tar.gz' -C ${srcdir}
}

package() {
  cp -a ${srcdir}/usr "${pkgdir}/"
  cp -a ${srcdir}/etc "${pkgdir}/"
}
