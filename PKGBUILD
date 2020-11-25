# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=amf-headers
pkgver=1.4.18
pkgrel=1
pkgdesc='Header files for AMD Advanced Media Framework'
arch=('any')
url='https://github.com/GPUOpen-LibrariesAndSDKs/AMF/'
license=('MIT')
source=("https://github.com/GPUOpen-LibrariesAndSDKs/AMF/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4f21ee07c8bb9b73ff48dbce7cb0917cdcd4d81d33333da391d97ce7f00642fe')

package() {
    local _file
    while read -r -d '' _file
    do
        install -D -m644 "$_file" "${pkgdir}/usr/include/AMF/${_file#"AMF-${pkgver}/amf/public/include"}"
    done < <(find "AMF-${pkgver}/amf/public/include" -type f -print0)
    
    install -D -m644 "AMF-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
