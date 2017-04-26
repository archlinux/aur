# Maintainer: Joseph R. Prostko <joe dot prostko at gmail dot com>

pkgname=aptly
pkgver=1.0.1
pkgrel=1
pkgdesc="A Swiss Army knife for Debian repository management."
url="https://www.aptly.info"
license=('MIT')
options=('!strip')
arch=('i686' 'x86_64')
source_i686=("https://bintray.com/artifact/download/smira/aptly/aptly_${pkgver}_linux_386.tar.gz")
source_x86_64=("https://bintray.com/artifact/download/smira/aptly/aptly_${pkgver}_linux_amd64.tar.gz")
sha256sums_i686=('8f2c844ef6b292b93aa05e236693653cb6d5148336147b4849458e143b3a427a')
sha256sums_x86_64=('1a674909a635824eca6b8fa6edb751997176b487dc39c7188a4a996663dab46a')

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
