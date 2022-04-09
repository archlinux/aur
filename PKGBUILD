# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: JP-Ellis <josh@jpellis.me>

pkgname=rocm-language-runtime
_pkgver_major=5
_pkgver_minor=1
_pkgver_patch=1
_pkgver_magic=48
pkgver=$_pkgver_major.$_pkgver_minor.$_pkgver_patch
pkgrel=1
pkgdesc="ROCr - ROCm runtime"
arch=('x86_64')
url="https://rocm-documentation.readthedocs.io/en/latest/"
license=()
depends=('rocm-core' 'hsakmt-roct' 'hsa-rocr' 'rocm-device-libs' 'comgr')
makedepends=()
source=("${pkgname}-${pkgver}.deb::https://repo.radeon.com/rocm/apt/${pkgver}/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver}.${_pkgver_major}$(printf '%02d' $_pkgver_minor $_pkgver_patch)-${_pkgver_magic}_amd64.deb")
sha256sums=('f13b7c15d28fac6b53271eabe00b801a79b435330214b468b06967e598961e8a')


package() {
    tar -xf data.tar.gz
    install -Dm644 opt/rocm-${pkgver}/.info/version-lrt "$pkgdir/opt/rocm/.info/version-lrt"
}
