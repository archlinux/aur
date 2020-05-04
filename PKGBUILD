# Maintainer: Jesse Luehrs <doy@tozt.net>
pkgname=rbw
pkgver=0.2.0
pkgrel=1
depends=('pinentry' 'openssl')
conflicts=('rbw-git')
provides=('rbw')
arch=('x86_64')
url="https://git.tozt.net/${pkgname}"
source=(https://git.tozt.net/rbw/releases/deb/${pkgname}_${pkgver}_amd64.deb)
sha256sums=('e7641631bd9c2da3a79feddec51b0a02d4b2ee7b55a7f72fbbb589651b42b73f')
pkgdesc="unofficial bitwarden cli"
license=('MIT')

package() {
    rm -rf tmp
    mkdir tmp
    tar xf data.tar.xz -C tmp
    install -Dm 755 tmp/usr/bin/rbw -t "${pkgdir}/usr/bin"
    install -Dm 755 tmp/usr/bin/rbw-agent -t "${pkgdir}/usr/bin"
    install -Dm 644 tmp/usr/share/doc/rbw/copyright "${pkgdir}/usr/share/licenses/rbw/LICENSE"
}
