# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: JP-Ellis <josh@jpellis.me>

pkgname=rocm-hip-libraries
_pkgver_major=5
_pkgver_minor=1
_pkgver_patch=3
_pkgver_magic=66
pkgver=$_pkgver_major.$_pkgver_minor.$_pkgver_patch
pkgrel=1
pkgdesc="Develop applications using HIP and libraries for AMD platforms"
arch=('x86_64')
url="https://rocm-documentation.readthedocs.io/en/latest/"
license=()
depends=('rocm-core' 'rocm-hip-runtime'
        'rocsparse' 'rccl' 'rocsolver' 'rocrand' 'rocfft' 'rocblas'
        'rocalution' 'hipblas' 'hipfft' 'hipsparse' 'hipfort')
makedepends=()
source=("${pkgname}-${pkgver}.deb::https://repo.radeon.com/rocm/apt/${pkgver}/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver}.${_pkgver_major}$(printf '%02d' $_pkgver_minor $_pkgver_patch)-${_pkgver_magic}_amd64.deb")
sha256sums=('41583a1b56a5444d2fc9744583035c03e5c9434f264767b377d67fd4400acee1')


package() {
    tar -xf data.tar.gz
    install -Dm644 opt/rocm-${pkgver}/.info/version-hip-libraries "$pkgdir/opt/rocm/.info/version-hip-libraries"
}
