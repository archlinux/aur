# Maintainer: Dave Blair <mail@dave-blair.de>

pkgname=spacefm-bin
pkgver=1.0.6
_subver=5
pkgrel=4
arch=('x86_64')
pkgdesc="SpaceFM binary package from debian bullseye, GTK3 version"
license=('GPL-2.0-only')
source=("http://ftp.de.debian.org/debian/pool/main/s/spacefm/spacefm-gtk3_${pkgver}-${_subver}_amd64.deb"
        "https://github.com/DaveX158/spacefm-ui-assets/archive/refs/tags/v1.tar.gz")
depends=(gtk3 startup-notification ffmpegthumbnailer)
provides=('spacefm')
conflicts=('spacefm' 'spacefm-gtk2' 'spacefm-gtk2-bin')
sha256sums=('912006c015b5e43943a87b8f1fe5a49abdd22b60a3d5a29f87b3e31d48856cd9'
            'aaac61c3caa02f869f3ebd21e09d93b700c864da8cb5231ad562371ba9e42c12')
url="https://packages.debian.org/bookworm/amd64/spacefm-gtk3"

prepare() {
  bsdtar -xf 'data.tar.xz' -C ${srcdir}
  cp -a 'spacefm-ui-assets-'*'/usr' ${srcdir}
}

package() {
  cp -a ${srcdir}/usr "${pkgdir}/"
  cp -a ${srcdir}/etc "${pkgdir}/"
}
