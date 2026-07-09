# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=Guitar
pkgname=${_basename,,}-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="Open source Git GUI Client"
arch=('x86_64')
url="https://github.com/soramimi/${_basename}"
license=('GPL-2.0-only')

makedepends=('tar')
depends=('glibc' 'libgcc' 'libstdc++' 'zlib' 'zstd' 'openssl' 'qt6-base' 'qt6-svg')

conflicts=("${pkgname%%-bin}")
provides=("${_basename^}")

source_x86_64=("${url}/releases/download/v${pkgver}/${_basename}_${pkgver}_amd64.deb")
sha256sums_x86_64=('747a44d8738bb0630fef968d2c000627fe7e3f5c960fa91c41be1218f4d88247')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
