# Maintainer: Joseph R. Prostko <joe dot prostko at gmail dot com>

pkgname=aptly
pkgver=1.4.0
pkgrel=2
pkgdesc="A Swiss Army knife for Debian repository management."
url="https://www.aptly.info"
license=('MIT')
options=('!strip')
arch=('i686' 'x86_64')
source_i686=("https://github.com/aptly-dev/aptly/releases/download/v${pkgver}/aptly_1.4.0_linux_386.tar.gz")
source_x86_64=("https://github.com/aptly-dev/aptly/releases/download/v${pkgver}/aptly_${pkgver}_linux_amd64.tar.gz")
sha256sums_i686=('53aee380cbfc96dc2e7c30b3df2ae11524d7227af1f613ad0964a24a88e15b10')
sha256sums_x86_64=('b3eb077d0e53b2361ab8db37b9bca1bf22018663274fddac0f3e4da6c48f1efb')

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
