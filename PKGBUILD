# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=bashman
_prefix=cargo
pkgname=${_basename}-bin
pkgver=0.10.3
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
sha256sums_x86_64=('929d56677992d964d63d3571890f17b7f0cfd27a8e895c9b41ba5965ec1c5f02')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
