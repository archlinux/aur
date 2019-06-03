# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='dynwg'
pkgver=1.0.0
pkgrel=1
pkgdesc='A DynDNS watchdog for WireGuard over systemd-networkd'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('python' 'wireguard-tools' 'iputils')
makedepends=('git')
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
md5sums=('SKIP')


package() {
    cd "${pkgname}"
    install -Dm 755 dynwg.py "${pkgdir}/usr/bin/dynwg"
    install -m 755 -d "${pkgdir}/usr/lib/systemd/system"
    install -m 644 dynwg.service "${pkgdir}/usr/lib/systemd/system"
    install -m 644 dynwg.timer "${pkgdir}/usr/lib/systemd/system"
}
