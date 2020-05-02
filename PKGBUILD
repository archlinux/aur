# Maintainer: Jesse Luehrs <doy@tozt.net>
pkgname=rbw
pkgver=0.1.1
pkgrel=1
depends=('pinentry' 'openssl')
conflicts=('rbw-git')
provides=('rbw')
arch=('x86_64')
url="https://git.tozt.net/${pkgname}"
source=(https://git.tozt.net/rbw/releases/deb/${pkgname}_${pkgver}_amd64.deb)
sha256sums=('20baa0ca78a4ad3d11c8d1508b539daa0f85157ff4795abbed61de473ccb7390')
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
