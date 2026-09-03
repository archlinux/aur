# Maintainer: pineappletoad

pkgname=scalapack-bin
pkgver=2.2.3
_pkgrel_src=1
pkgrel=1
pkgdesc="Subset of scalable LAPACK routines redesigned for distributed memory computers (precompiled)"
arch=('x86_64')
url="http://www.netlib.org/scalapack"
license=('BSD-3-Clause')
options=('!debug')
provides=('scalapack' 'blacs')
conflicts=('scalapack')
depends=('glibc' 'openmpi' 'blas' 'lapack')

source=("https://github.com/tubbywrestler/scalapack-bin/releases/download/${pkgver}-${_pkgrel_src}/scalapack-${pkgver}-${_pkgrel_src}-x86_64.pkg.tar.zst")
sha256sums=('771086d5720ec038d83bbe274c8a0c72f5e8920ad3b588a8f1e7206554e5d073')

package() {
    bsdtar -xf "${srcdir}/scalapack-${pkgver}-${_pkgrel_src}-x86_64.pkg.tar.zst" -C "${pkgdir}" --exclude .PKGINFO --exclude .BUILDINFO --exclude .MTREE
}
