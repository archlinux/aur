# Maintainer: pineappletoad

pkgname=mumps-bin
pkgver=5.9.1
_pkgrel_src=1
pkgrel=1
pkgdesc="Sparse solver library using Gaussian elimination (precompiled)"
arch=('x86_64')
url="https://mumps-solver.org"
license=('custom')
options=('!debug')
provides=('mumps')
conflicts=('mumps' 'mumps-par' 'mumps4')
depends=('lapack' 'openmpi' 'scotch' 'scalapack' 'metis' 'zlib' 'bzip2')

source=("https://github.com/tubbywrestler/mumps-bin/releases/download/${pkgver}-${_pkgrel_src}/mumps-${pkgver}-${_pkgrel_src}-x86_64.pkg.tar.zst")
sha256sums=('487d8667f8b9d6a88041b750d921acca05861bfc9912d1b7b579ec3d4e04fe83')

package() {
    bsdtar -xf "${srcdir}/mumps-${pkgver}-${_pkgrel_src}-x86_64.pkg.tar.zst" -C "${pkgdir}" --exclude .PKGINFO --exclude .BUILDINFO --exclude .MTREE
}
