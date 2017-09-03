# Maintainer: Joseph R. Prostko <joe dot prostko at gmail dot com>

pkgname=aptly
pkgver=1.1.1
pkgrel=1
pkgdesc="A Swiss Army knife for Debian repository management."
url="https://www.aptly.info"
license=('MIT')
options=('!strip')
arch=('i686' 'x86_64')
source_i686=("https://bintray.com/artifact/download/smira/aptly/aptly_${pkgver}_linux_386.tar.gz")
source_x86_64=("https://bintray.com/artifact/download/smira/aptly/aptly_${pkgver}_linux_amd64.tar.gz")
sha256sums_i686=('04bde40b47bfe42ee530d5d12354f21f00f6ca0ff857503219c2e3b863953f24')
sha256sums_x86_64=('cc2c50106ce1932db31e5d30bb448f8992428b3cfc66d23abf96fa2aad7a3748')

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
