# Maintainer: Joseph R. Prostko <joe dot prostko at gmail dot com>

pkgname=aptly
pkgver=1.3.0
pkgrel=1
pkgdesc="A Swiss Army knife for Debian repository management."
url="https://www.aptly.info"
license=('MIT')
options=('!strip')
arch=('i686' 'x86_64')
source_i686=("https://bintray.com/artifact/download/smira/aptly/aptly_${pkgver}_linux_386.tar.gz")
source_x86_64=("https://bintray.com/artifact/download/smira/aptly/aptly_${pkgver}_linux_amd64.tar.gz")
sha256sums_i686=('e883fda8434e767e767cbd21ab6cb0e131e03e22a99abfaf7d3c0f36d8e8687b')
sha256sums_x86_64=('e45bb349be0ef9a628a17f6eb0b4ccb277563c99214e222e5f28b823f129f47b')

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
