# Maintainer: Joseph R. Prostko <joe dot prostko at gmail dot com>

pkgname=aptly
pkgver=1.2.0
pkgrel=1
pkgdesc="A Swiss Army knife for Debian repository management."
url="https://www.aptly.info"
license=('MIT')
options=('!strip')
arch=('i686' 'x86_64')
source_i686=("https://bintray.com/artifact/download/smira/aptly/aptly_${pkgver}_linux_386.tar.gz")
source_x86_64=("https://bintray.com/artifact/download/smira/aptly/aptly_${pkgver}_linux_amd64.tar.gz")
sha256sums_i686=('21f2070830dd327b7aed1025566db86fc9d65a87068eb9a713495aa4de3924ae')
sha256sums_x86_64=('fc90a9e13239cc554dbf16c71f1302a8adc02a3fa0666f12492f9051e87152a0')

package() {
    # Test for current architecture
    if test "$CARCH" == x86_64; then
      _arch="amd64"; else
      _arch="386"
    fi
    
    # Install the binary, along with the license file and the manual page
    cd ${pkgname}_${pkgver}_linux_${_arch} 
    install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 man/${pkgname}.1 ${pkgdir}/usr/share/man/man1/${pkgname}.1
}
