# Maintainer: Simao Gomes Viana <xdevs23@outlook.com>

pkgbase=linux-nitrous-headers
pkgname=linux-nitrous-headers
pkgver=5.3.9
pkgrel=6
_tar_pkgrel=6
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
sha256sums=('b6200b4d1e596557ac579971b56b391563f4fa77bcfc6063aa6a2cff87b00a7c')

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
    rm -f "$pkgdir/*.tar.*"
}
