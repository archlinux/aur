# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>

pkgname=rocm-developer-tools
_pkgver_major=5
_pkgver_minor=2
_pkgver_patch=3
_pkgver_magic=109
pkgver=$_pkgver_major.$_pkgver_minor.$_pkgver_patch
pkgrel=1
pkgdesc="Packages required to debug and profile HIP-based applications"
arch=('x86_64')
url="https://docs.amd.com"
license=()
depends=('rocm-core' 'rocm-hip-sdk' 'rocprofiler' 'roctracer'
         'rocm-gdb' 'rocm-dbgapi' 'rocm-debug-agent')
makedepends=()
source=("${pkgname}-${pkgver}.deb::https://repo.radeon.com/rocm/apt/${pkgver}/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver}.${_pkgver_major}$(printf '%02d' $_pkgver_minor $_pkgver_patch)-${_pkgver_magic}_amd64.deb")
sha256sums=('c6bb59da0e62cca77e6ed04a1544439ac9b7193431efe5c3e69f8c482d83d38b')

package() {
    tar -xf data.tar.gz
    install -D opt/rocm-${pkgver}/.info/version-rocm-developer-tools "$pkgdir/opt/rocm/.info/version-rocm-developer-tools"
}
