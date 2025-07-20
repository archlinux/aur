# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname=nvshmem
pkgver=3.3.9
_cudaver=12
pkgrel=3
pkgdesc="NVSHMEM is a software library that implements the OpenSHMEM application programming interface (API) for clusters of NVIDIA ® GPUs."
arch=('x86_64')
url="https://developer.nvidia.com/nvshmem"
license=(LicenseRef-NVIDIA-NVSHMEM)
depends=('libpciaccess' 'nvidia-utils' 'cuda>='"${_cudaver}" 'glibc' 'gcc-libs' 'openmpi' 'libfabric' 'openucx' 'libevent' 'hwloc' 'openpmix' 'numactl' 'binutils' 'zlib' 'zstd' 'systemd-libs' 'libcap' 'rdma-core' 'intel-oneapi-openmp')
options=(!strip staticlibs)
source=("https://developer.download.nvidia.com/compute/${pkgname}/redist/lib${pkgname}/linux-x86_64/lib${pkgname}-linux-x86_64-${pkgver}_cuda${_cudaver}-archive.tar.xz")
sha256sums=('72a788ef5723a30d8882b193f0a513f454ecaee3ab5a225a5c43db79d433ef66')

package() {
  cd lib${pkgname}-linux-x86_64-${pkgver}_cuda${_cudaver}-archive
  mkdir "$pkgdir"/usr
  cp -r bin include lib share "$pkgdir"/usr
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
