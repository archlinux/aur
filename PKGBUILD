# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>

pkgname=rocm-developer-tools
_pkgver_major=5
_pkgver_minor=2
_pkgver_patch=1
_pkgver_magic=79
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
sha256sums=('f73ba6f950429313d9755061e2e896375ab2a90defb9e93557a457ce606a96a0')


package() {
    tar -xf data.tar.gz
    install -D opt/rocm-${pkgver}/.info/version-rocm-developer-tools "$pkgdir/opt/rocm/.info/version-rocm-developer-tools"
}
