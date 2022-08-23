# Maintainer: Santiago Lo Coco <mail at slococo dot com dot ar>

pkgname="bashmount"
pkgver=4.3.2
pkgrel=2
pkgdesc="Tool to mount and unmount removable media from the command-line."
arch=('any')
url="https://github.com/jamielinux/bashmount"
license=("GPL2")
optdepends=('udisks2: remove media without sudo')
backup=('etc/bashmount.conf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4fa5be39b10c3ce24f3f21ff6605ce0499ab9b24baf1b5762be36b9003eab169')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 bashmount "${pkgdir}/usr/bin/bashmount"
    install -Dm644 bashmount.conf "${pkgdir}/etc/bashmount.conf"
    gzip -c -9 bashmount.1 > bashmount.1.gz
    install -Dm644 bashmount.1.gz "${pkgdir}/usr/share/man/man1/bashmount.1.gz"
    install -dm755 "${pkgdir}/usr/share/doc/bashmount"
    install -m644 COPYING "${pkgdir}/usr/share/doc/bashmount/COPYING"
    install -m644 NEWS "${pkgdir}/usr/share/doc/bashmount/NEWS"
}
