# Maintainer: FraV1982 <consulenza dot vangi at outlook dot com>

pkgname=boot-sav
pkgver=4ppa200
pkgrel=1
pkgdesc="Library for different packages. Required from OS-Uninstaller, Boot-Repair, etc..."
arch=(x86_64 aarch64 armv6h armv7h i686)
url=""
license=('custom')
depends=('gawk' 'gettext' 'lsb-release' 'lzip' 'mawk' 'parted' 'xdg-utils' 'xz' 'zenity' 'glade2script')
options=("!emptydirs" "!strip")

_debname=boot-sav_4ppa200_all.deb

source=(https://ftp5.gwdg.de/pub/linux/debian/mint/packages/pool/import/b/boot-repair/boot-sav_4ppa200_all.deb)
md5sums=('SKIP')
sha256sums=('SKIP')
sha512sums=('SKIP')

prepare() {
    cd "$srcdir"
    msg2 "Decompressing Debian package boot-sav..."
    ar xv "${_debname}" > /dev/null
    tar -xf data.tar.xz > /dev/null

    find ./usr -type d -exec chmod 755 '{}' \;
}

package() {
    cd "$srcdir"
    cp -dpr --no-preserve=ownership ./usr "$pkgdir"
}
