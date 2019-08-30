# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=amf-headers
pkgver=1.4.14
pkgrel=1
pkgdesc='Header files for AMD Advanced Media Framework'
arch=('any')
url='https://github.com/GPUOpen-LibrariesAndSDKs/AMF/'
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/GPUOpen-LibrariesAndSDKs/AMF/archive/${pkgver}.tar.gz")
sha256sums=('75b9a626c34fab6051fbd132eccbc82e05560d67006c126bfc33fb46401bc62b')

package() {
    cd "AMF-${pkgver}"
    
    mkdir -p "${pkgdir}/usr/include/AMF"
    
    local _dir
    while read -r -d '' _dir
    do
        cp -a "$_dir" "${pkgdir}/usr/include/AMF"
    done < <(find ./amf/public/include -maxdepth 1 -mindepth 1 -type d -print0)
    
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
