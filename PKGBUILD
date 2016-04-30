# Maintainer: Joseph R. Prostko <joe dot prostko at gmail dot com>

pkgname=aptly
pkgver=0.9.7
pkgrel=1
pkgdesc="A Swiss Army knife for Debian repository management."
url="https://www.aptly.info"
license=('MIT')
options=(!strip)
arch=('i686' 'x86_64')
source_i686=("https://bintray.com/artifact/download/smira/aptly/aptly_${pkgver}_linux_386.tar.gz")
source_x86_64=("https://bintray.com/artifact/download/smira/aptly/aptly_${pkgver}_linux_amd64.tar.gz")
sha256sums_i686=('22b5ab49714d9c2ceaa31c1529cad2e2a968378de2e3c67d41ef5c53211472e1')
sha256sums_x86_64=('ec877942783c7a24566c802120da51d4cecaf2c76d3151e1a4869da1ee0690f7')

package() {
    # Test for current architecture
    if test "$CARCH" == x86_64; then
      _arch="amd64"; else
      _arch="386"
    fi
    
    # Install the binary and the license file
    cd ${pkgname}_${pkgver}_linux_${_arch} 
    install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
