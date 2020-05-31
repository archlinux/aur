# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=amf-headers
pkgver=1.4.16.1
pkgrel=1
pkgdesc='Header files for AMD Advanced Media Framework'
arch=('any')
url='https://github.com/GPUOpen-LibrariesAndSDKs/AMF/'
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/GPUOpen-LibrariesAndSDKs/AMF/archive/${pkgver}.tar.gz")
sha256sums=('347ee0adcbd600b4d86faf62b98571d22e8f20b8c803a263a825ee3886e631e4')

package() {
    mkdir -p "${pkgdir}/usr/include/AMF"
    
    local _dir
    while read -r -d '' _dir
    do
        cp -a "$_dir" "${pkgdir}/usr/include/AMF"
    done < <(find "AMF-${pkgver}/amf/public/include" -maxdepth 1 -mindepth 1 -type d -print0)
    
    install -D -m644 "AMF-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
