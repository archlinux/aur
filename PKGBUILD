# Maintainer: Jesse Luehrs <archlinux@tozt.net>
pkgname=rbw-bin
_name=${pkgname%-*}
pkgver=0.5.2
pkgrel=1
depends=('pinentry' 'openssl')
conflicts=('rbw-git' 'rbw')
provides=('rbw')
arch=('x86_64')
url="https://git.tozt.net/${_name}"
source=(https://git.tozt.net/rbw/releases/deb/${_name}_${pkgver}_amd64.deb)
sha256sums=('fca8838ac33d435981ce2a0e444aa0fc5e5f165c00a19d7c947b240c46276927')
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
