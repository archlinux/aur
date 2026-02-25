pkgname=linux-rvkernel-bore-zfs-clang
pkgver=6.19.3
pkgrel=1
pkgdesc="zfs module for the linux-rvkernel-bore-clang kernel"
arch=('x86_64')
url="https://github.com/Rve27/RvKernel-Linux"
license=('CDDL')
depends=('pahole' 'linux-rvkernel-bore-clang')
provides=('ZFS-MODULE')
source=(
  "https://github.com/Rve27/RvKernel-Linux/releases/download/${pkgver}/linux-rvkernel-bore-lto-zfs-${pkgver}-${pkgrel}-${arch[0]}.pkg.tar.zst"
)
noextract=(
  "linux-rvkernel-bore-lto-zfs-${pkgver}-${pkgrel}-${arch[0]}.pkg.tar.zst"
)

package() {
  cd "${srcdir}"
  bsdtar -xf "linux-rvkernel-bore-lto-zfs-${pkgver}-${pkgrel}-${arch[0]}.pkg.tar.zst" -C "${pkgdir}"

  rm -f "${pkgdir}"/{.BUILDINFO,.MTREE,.PKGINFO}
}

sha256sums=('7342a4c4dc4559ed75f565e2e3a855faa1f803a30841d8ab1d9d931011c9b71f')
