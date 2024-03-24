# Maintainer: FraV1982 <consulenza dot vangi at outlook dot com>

pkgname=boot-repair
pkgver=4ppa200
pkgrel=1
pkgdesc="A little software for MBR and Boot Record recovery."
arch=(x86_64 aarch64 armv6h armv7h i686)
url="https://sourceforge.net/p/boot-repair/home/Home/"
license=('GPL')
depends=('boot-sav')
options=("!emptydirs" "!strip")

_debname=boot-repair_4ppa200_all.deb

source=(https://ftp5.gwdg.de/pub/linux/debian/mint/packages/pool/import/b/boot-repair/boot-repair_4ppa200_all.deb)
md5sums=('SKIP')
sha256sums=('SKIP')
sha512sums=('SKIP')

prepare() {
    cd "$srcdir"
    msg2 "Decompressing Debian package boot-repair..."
    ar xv "${_debname}" > /dev/null
    tar -xf data.tar.xz > /dev/null

    find ./etc -type d -exec chmod 755 '{}' \;
    find ./usr -type d -exec chmod 755 '{}' \;
}

package() {
    cd "$srcdir"
    cp -dpr --no-preserve=ownership {etc,usr} "$pkgdir"
}
