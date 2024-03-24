# Maintainer: FraV1982 <consulenza dot vangi at outlook dot com>

pkgname=glade2script-python3
pkgver=3.2.4~ppa23
pkgrel=1
pkgdesc="Glade interface engine for scripts (Python3 version)"
arch=(x86_64 aarch64 armv6h armv7h i686)
url=""
license=('custom')
depends=('python')
options=("!emptydirs" "!strip")

_debname=glade2script-python3_3.2.4~ppa23_all.deb

source=(https://ftp5.gwdg.de/pub/linux/debian/mint/packages/pool/import/g/glade2script/glade2script-python3_3.2.4~ppa23_all.deb)
md5sums=('SKIP')
sha256sums=('SKIP')
sha512sums=('SKIP')

prepare() {
    cd "$srcdir"
    msg2 "Decompressing Debian package glade2script-python3..."
    ar xv "${_debname}" > /dev/null
    tar -xf data.tar.xz > /dev/null

    find ./etc -type d -exec chmod 755 '{}' \;
    find ./usr -type d -exec chmod 755 '{}' \;
}

package() {
    cd "$srcdir"
    cp -dpr --no-preserve=ownership {etc,usr} "$pkgdir"
}
