# Maintainer: illlights <admin at illlights dot com>

_npmname=minyami
_npmver=5.3.1
pkgname="nodejs-${_npmname}"
pkgver="${_npmver}"
pkgrel=1
pkgdesc="A lovely video downloader for HLS videos"
arch=('any')
url="https://github.com/Last-Order/Minyami"
license=('GPL-3.0')
depends=('nodejs' 'npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
noextract=("${_npmname}-${_npmver}.tgz")
sha256sums=("6442b5b86afe963f308c77f2cf327e638b380c067dc35668174d8ef9b7c3a2c1")

package() {
    cd "${srcdir}"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install --user root -g --prefix "${pkgdir}/usr" "${_npmname}@${_npmver}"
}
