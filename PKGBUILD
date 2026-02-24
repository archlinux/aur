pkgname=linux-rvkernel-bore-nvidia-open-clang
pkgver=6.19.3
pkgrel=1
nv_ver=590.48.01
pkgdesc="nvidia open modules of ${_nv_ver} driver for the linux-rvkernel-bore-clang kernel"
arch=('x86_64')
url="https://github.com/Rve27/RvKernel-Linux"
license=('MIT AND GPL-2.0-only')
depends=('libglvnd' 'nvidia-utils=${_nv_ver}' 'linux-rvkernel-bore-clang' 'linux-rvkernel-bore-headers-clang')
provides=('NVIDIA-MODULE')
source=(
  "https://github.com/Rve27/RvKernel-Linux/releases/download/${pkgver}/linux-rvkernel-bore-lto-nvidia-open-${pkgver}-${pkgrel}-${arch[0]}.pkg.tar.zst"
)
noextract=(
  "linux-rvkernel-bore-lto-nvidia-open-${pkgver}-${pkgrel}-${arch[0]}.pkg.tar.zst"
)

package() {
  cd "${srcdir}"
  bsdtar -xf "linux-rvkernel-bore-lto-nvidia-open-${pkgver}-${pkgrel}-${arch[0]}.pkg.tar.zst" -C "${pkgdir}"

  rm -f "${pkgdir}"/{.BUILDINFO,.MTREE,.PKGINFO}
}

sha256sums=('d2c30ec57bebb539196e8d0f889b486d5e1722c5df8438e628283b24869c1db0')
