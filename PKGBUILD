# Maintainer: Simao Gomes Viana <xdevs23@outlook.com>

pkgbase=linux-nitrous-headers
pkgname=linux-nitrous-headers
pkgver=5.4.3
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
sha256sums=('607dd64612c7ae0fdbf8033ea0ce0f03396a3a453444b2b016f5f3e024e31b2b')

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
