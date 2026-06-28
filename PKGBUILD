# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=Guitar
pkgname=${_basename,,}-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Open source Git GUI Client"
arch=('x86_64')
url="https://github.com/soramimi/Guitar"
license=('GPL-2.0-only')

makedepends=('tar')
depends=('glibc' 'libgcc' 'libstdc++' 'zlib' 'zstd' 'openssl' 'qt6-base' 'qt6-svg')

conflicts=("${_basename,,}")
provides=("${_basename^}")

source_x86_64=("${url}/releases/download/v${pkgver}/${_basename}_${pkgver}_amd64.deb")
sha256sums_x86_64=('f02c7c2e0886b3226f1801d55857e2f2ab4cd2a32fdf6210ccb3d855b42b6000')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
