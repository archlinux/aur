# Maintainer: MotorTruck1221 motortruck1221@protonmail.com

pkgname=corlink-server-git
pkgver=0.0.1
pkgrel=1
pkgdesc="The corlink licensing server for the corlink project."
url="https://github.com/ruby-network/corlink/license"
arch=('x86_64')
license=('GPL3')
depends=('make' 'go' 'upx')
makedepends=('git')
provides=('corlink-server')
license=('GPL3')
conflicts=('corlink-server')
url="https://github.com/ruby-network/corlink"
source=("git+$url")
sha256sums=('SKIP')
package() {
    cd "${srcdir}/corlink/license"
    make default
    make compress
    install -Dm755 "${srcdir}/corlink/license/bin/corlink-server" "${pkgdir}/usr/bin/corlink-server"
}
