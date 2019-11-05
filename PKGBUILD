# Maintainer: Simao Gomes Viana <xdevs23@outlook.com>

pkgname=linux-nitrous
pkgver=5.3.8
pkgrel=13
_tar_pkgrel=12
pkgdesc="Modified Linux kernel optimized for Haswell (and newer) compiled using clang"
arch=('x86_64')
url="https://gitlab.com/xdevs23/linux-nitrous"
license=('GPL2')
groups=()
depends=()
provides=('linux')
conflicts=('linux-nitrous-git')
makedepends=('tar')
source=("https://github.com/xdevs23/linux-nitrous/releases/download/v$pkgver-$_tar_pkgrel/linux-nitrous-git-$pkgver-$_tar_pkgrel-x86_64.pkg.tar.xz")
sha256sums=('fe0023e1f244a7f98247d434b01a5ab20eb23aebcccc61ddd8188ed06c5111b9')

build() {
    echo "No need to build anything"
}

package() {
    cd "$srcdir"
    cp -R "$srcdir/$pkgname-$pkgver/." "$pkgdir/."
    mv "$srcdir/$pkgname-$pkgver/.INSTALL" "${startdir}/linux-nitrous.install"
    install="linux-nitrous.install"
    for f in .BUILDINFO .MTREE .INSTALL .PKGINFO; do
      rm -f "$pkgdir/$f"
    done
}
