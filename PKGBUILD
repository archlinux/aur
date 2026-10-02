# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=bashman
_prefix=cargo
pkgname=${_basename}-bin
pkgver=0.10.2
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
sha256sums_x86_64=('090f61c46f515644a786f5f253d2520a905493a5052b106250b9e4a2751a9d27')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
