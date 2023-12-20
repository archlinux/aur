# Maintainer: A. L. <aur-list at outlook dot com>
pkgname=hip-runtime-amd-blender
pkgver=5.6.1
pkgrel=1
pkgdesc="Heterogeneous Interface for Portability ROCm that doesn't freeze blender"
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/HIP/en/latest/'
license=('MIT')
depends=('mesa' 'libelf' 'libdrm' 'numactl' 'pciutils' 'python')
makedepends=('wget' 'tar')
provides=('hip' 'comgr' 'hsa-rocr' 'hsakmt-roct' 'rocm-device-libs' 'rocm-llvm' 'rocminfo' 'hip-runtime-amd')
conflicts=('hip' 'comgr' 'hsa-rocr' 'hsakmt-roct' 'rocm-device-libs' 'rocm-llvm' 'rocminfo' 'hip-runtime-amd')

package() {
  for n in comgr hsa-rocr hsakmt-roct rocm-device-libs rocm-llvm rocminfo hip-runtime-amd; do
    wget -nc https://archive.archlinux.org/packages/${n:0:1}/${n}/${n}-5.6.1-1-x86_64.pkg.tar.zst
    tar xf $n-5.6.1-1-x86_64.pkg.tar.zst
  done

  cp -r etc opt usr ${pkgdir}
}
