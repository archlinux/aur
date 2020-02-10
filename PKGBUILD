# Maintainer: omgold@aur
pkgname=satanic-icon-themes
pkgver=666.9
pkgrel=1
pkgdesc="Icons from Ubuntu Satanic Edition."
url="http://www.ubuntusatanic.org"
arch=('any')
license=('GPL')
optdepends=()
makedepends=(squashfs-tools)
conflicts=()
replaces=()
backup=()
_iso_file=satanic-undead-i386-666.9.iso
source=("https://netix.dl.sourceforge.net/project/archiveos/u/ubuntu-satanic/$_iso_file")
noextract=($_iso_file)

sha256sums=('dec381affcc91edc0273bfe736da07cb4c7cd2db3e95b6d724735ff8cd73ddfd')

build() {
    bsdtar -xf ${_iso_file} casper/filesystem.squashfs
    rm -rf $srcdir/squashfs-root
    unsquashfs $srcdir/casper/filesystem.squashfs /usr/share/icons/
}

package() {
    mkdir -p $pkgdir/usr/share/icons
    mv $srcdir/squashfs-root/usr/share/icons/{Revenge,Sanguine} $pkgdir/usr/share/icons
}
