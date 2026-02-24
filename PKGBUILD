pkgname=linux-rvkernel-bore-headers-clang
pkgver=6.19.3
pkgrel=1
pkgdesc="Headers and scripts for building modules for the Linux RvKernel BORE Clang"
arch=('x86_64')
url="https://github.com/Rve27/RvKernel-Linux"
license=('GPL-2.0-only')
depends=('pahole' 'linux-rvkernel-bore-clang')
source=(
  "https://github.com/Rve27/RvKernel-Linux/releases/download/${pkgver}/linux-rvkernel-bore-lto-headers-${pkgver}-${pkgrel}-${arch[0]}.pkg.tar.zst"
)
noextract=(
  "linux-rvkernel-bore-lto-headers-${pkgver}-${pkgrel}-${arch[0]}.pkg.tar.zst"
)

package() {
  cd "${srcdir}"
  bsdtar -xf "linux-rvkernel-bore-lto-headers-${pkgver}-${pkgrel}-${arch[0]}.pkg.tar.zst" -C "${pkgdir}"

  rm -f "${pkgdir}"/{.BUILDINFO,.MTREE,.PKGINFO}
}

sha256sums=('d0fb1b7b0ccc1b3959111e71294e45a62f611013a586c56d36b298822a508e18')
