# Maintainer: Simao Gomes Viana <xdevs23@outlook.com>

pkgbase=linux-nitrous-headers
pkgname=linux-nitrous-headers
pkgver=5.5.1
pkgrel=2
_tar_pkgrel=2
pkgdesc="Headers for linux-nitrous"
arch=('x86_64')
url="https://gitlab.com/xdevs23/linux-nitrous"
license=('GPL2')
groups=()
depends=()
provides=('linux')
conflicts=('linux-nitrous-git-headers')
makedepends=('tar')
options=('!strip')
source=("https://github.com/xdevs23/linux-nitrous/releases/download/v$pkgver-$_tar_pkgrel/linux-nitrous-git-headers-$pkgver-$_tar_pkgrel-x86_64.pkg.tar.xz")
sha256sums=('957f99ec0b9ffad4dd3fe6f206d5c5b76c945ec6fd4576468af71742cbb16ebe')

build() {
    echo "No need to build anything"
}

package() {
    cd "$srcdir"
    cp -R "$srcdir/." "$pkgdir/."
    if [ -f "$srcdir/.INSTALL" ]; then
      mv "$srcdir/.INSTALL" "${startdir}/linux-nitrous-headers.install"
      install="linux-nitrous-headers.install"
    fi
    for f in .BUILDINFO .INSTALL .MTREE .PKGINFO; do
      rm -f "$pkgdir/$f"
    done
    find "$pkgdir" -maxdepth 2 -name "linux*.pkg.tar.xz" | xargs rm -f
}
