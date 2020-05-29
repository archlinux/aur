# Maintainer: Jesse Luehrs <archlinux@tozt.net>
pkgname=rbw-bin
_name=${pkgname%-*}
pkgver=0.4.1
pkgrel=1
depends=('pinentry' 'openssl')
conflicts=('rbw-git' 'rbw')
provides=('rbw')
arch=('x86_64')
url="https://git.tozt.net/${_name}"
source=(https://git.tozt.net/rbw/releases/deb/${_name}_${pkgver}_amd64.deb)
sha256sums=('9a2c0a8f6301b989aa66ac034c8e1180100eb98c1ed89d521502e2f1c22a4e0c')
pkgdesc="unofficial bitwarden cli"
license=('MIT')

package() {
    rm -rf tmp
    mkdir tmp
    tar xf data.tar.xz -C tmp
    install -Dm 755 tmp/usr/bin/rbw -t "${pkgdir}/usr/bin"
    install -Dm 755 tmp/usr/bin/rbw-agent -t "${pkgdir}/usr/bin"
    install -Dm 644 tmp/usr/share/doc/rbw/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
