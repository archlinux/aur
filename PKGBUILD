# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=bashman
_prefix=cargo
pkgname=${_basename}-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="Cargo plugin that helps you generate BASH completions and/or MAN pages for your Rust apps using metadata from your projects' Cargo.toml manifests"
arch=('x86_64')
url="https://github.com/Blobfolio/${_basename}"
license=('WTFPL')
conflicts=("${_basename}")
provides=("${_prefix}-${_basename}")
makedepends=('tar')
depends=('glibc' 'gcc-libs')

source_x86_64=("${url}/releases/download/v${pkgver}/${_prefix}-${_basename}_${pkgver}-${pkgrel}_amd64.deb")
sha256sums_x86_64=('4515d1d079d315f8163ffe6974aac590e6af1ce70eddd002fc21378f11d28bae')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
